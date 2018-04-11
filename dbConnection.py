import pymysql.cursors

class dbConnection(object):

    # depending on the configuration port, user, password and the db name will be changed
    def getConnection(self):
        try:
            connection = pymysql.connect(host='127.0.0.1',
                                     port=3306,
                                     user='root',
                                     password='',
                                     db='movie_recommend',
                                     charset='utf8',
                                     cursorclass=pymysql.cursors.DictCursor)
        except:
            print("DB didn't connect")
        finally:
            return connection

    def createMovieRow(self, argument):
        connection = self.getConnection()
        inserted = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT INTO `movie` (`movie_id`, `imdb_id`, `poster_path`,`budget`, `title`, `year`, `avg_rating_imdb`, `avg_rating_tmdb`, `director`, `country`, `original_language`, `release_date`, `votes_count`) " \
                      "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                cursor.execute(sql, argument)

            connection.commit()
            inserted = 1
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error, pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError, pymysql.ProgrammingError) as e:
            print('Got error {!r} in movie table, errno is {}'.format(e, e.args[0]))
            # print(cursor.mogrify(sql, argument))
            raise
            # print("An error has been raised during insertion")
        except:
            print("don't konw")
        finally:
            if inserted:
                return inserted
            connection.close()

    def createMultiGenreRow(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT IGNORE INTO `genre` (`genre_name`) " \
                      "VALUES (%s)"
                numberOfRows = cursor.executemany(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning) as e:
            print(e)
            return None
        finally:
            return numberOfRows
            connection.close()

    def createMultiGenreMovieRow(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT IGNORE INTO `movie_genre` (`movie_id`, `genre_name`) " \
                      "VALUES (%s, %s)"
                numberOfRows = cursor.executemany(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning) as e:
            print(e)
            return None
        finally:
            return numberOfRows
            connection.close()

    def deleteSimpleRecommendation(self):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "Delete from simple_recommendation"

                numberOfRows = cursor.execute(sql)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            print(cursor.mogrify(sql))
            raise
            return None
        finally:
            return numberOfRows
            connection.close()

    def updateMovieDirector(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "Update movie set director = %s where movie_id = %s"
                numberOfRows = cursor.execute(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            # print(cursor.mogrify(sql, argument))
            raise
            # print("An error has been raised during insertion")
        except:
            print("don't konw")
        finally:
            if numberOfRows:
                return numberOfRows
            connection.close()

    def updateMovieMetadata(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "Update movie set overview = %s, runtime = %s, tagline = %s where movie_id = %s"
                numberOfRows = cursor.execute(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            # print(cursor.mogrify(sql, argument))
            raise
            # print("An error has been raised during insertion")
        except:
            print("don't konw")
        finally:
            if numberOfRows:
                return numberOfRows
            connection.close()

    def createMultiCastActorRow(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT INTO `casts` (`actor_name`, `movie_id`, `character`) " \
                      "VALUES (%s, %s, %s)"
                numberOfRows = cursor.executemany(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            # print(cursor.mogrify(sql, argument))
            raise
            # print("An error has been raised during insertion")
        except:
            print("don't konw")
        finally:
            if numberOfRows:
                return numberOfRows
            connection.close()

    def createMultiProductionMovieRow(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT IGNORE INTO `production` (`movie_id`, `production`) " \
                      "VALUES (%s, %s)"
                numberOfRows = cursor.executemany(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning) as e:
            print(e)
            return None
        finally:
            return numberOfRows
            connection.close()

    def createMultiCastRow(self, list):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT INTO `casts` (`movie_id`, `actor_name`) " \
                      "VALUES (%s, %s)"
                numberOfRows = cursor.executemany(sql, list)
            connection.commit()
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning) as e:
            print(e)
            return None
        finally:
            return numberOfRows
            connection.close()

    def createMultipleRow(self, data):
        connection = self.getConnection()
        numberOfRows = -1
        try:
            with connection.cursor() as cursor:
                sql = "INSERT INTO `bitcoin_daily` (`date`, `timestamp`, `open`, `high`, `low`, `close`, `volume`, `market_cap` ) " \
                      "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
                numberOfRows = cursor.executemany(sql, data)
            connection.commit()
        except:
            print("An error has been raised")
        finally:
            return numberOfRows
            connection.close()


    def fetchAllWithoutPoster(self):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "SELECT `imdb_id` FROM `movie` where poster_path='No image'"
                cursor.execute(sql)
                result = cursor.fetchall()
                return result
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            raise
        finally:
            connection.close()

    def fetchAllWithoutDirector(self):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "SELECT `imdb_id`,`movie_id` FROM `movie` where director=''"
                cursor.execute(sql)
                result = cursor.fetchall()
                return result
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            raise
        finally:
            connection.close()

    def fetchAllGenre(self):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "select genre_name from movie_genre group by genre_name"
                cursor.execute(sql)
                result = cursor.fetchall()
                return result
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            raise
        finally:
            connection.close()

    def fetchAllGenre(self):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "select genre_name from movie_genre group by genre_name"
                cursor.execute(sql)
                result = cursor.fetchall()
                return result
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            raise
        finally:
            connection.close()

    def updatePosterURL(self, poster_path, imdbID):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "update `movie` set poster_path = %s where imdb_id = %s"
                data = (poster_path, imdbID)
                result = cursor.execute(sql, data)
                return result
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            print(cursor.mogrify(sql, data))
            raise
        finally:
            connection.close()

    def selectAllMovie(self):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "Select * from movie"
                result = cursor.execute(sql)
                result = cursor.fetchall()
                return result;
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            print(cursor.mogrify(sql))
            raise
        finally:
            connection.close()

    def getByMID(self, movieID):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "Select * from movie where movie_id = %s"
                result = cursor.execute(sql, movieID)
                result = cursor.fetchall()
                return result;
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            print(cursor.mogrify(sql))
            raise
        finally:
            connection.close()

    def getMovieGenre(self, movieID):
        connection = self.getConnection()
        try:
            with connection.cursor() as cursor:
                sql = "Select genre_name from movie_genre where movie_id = %s"
                result = cursor.execute(sql, movieID)
                result = cursor.fetchall()
                return result;
        except (pymysql.DatabaseError, pymysql.MySQLError, pymysql.Warning, pymysql.DataError, pymysql.Error,
                pymysql.InternalError, pymysql.IntegrityError, pymysql.InterfaceError, pymysql.OperationalError,
                pymysql.ProgrammingError) as e:
            print('Got error in casts table{!r}, errno is {}'.format(e, e.args[0]))
            print(cursor.mogrify(sql))
            raise
        finally:
            connection.close()

# ALTER TABLE `users` ADD `id` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;


