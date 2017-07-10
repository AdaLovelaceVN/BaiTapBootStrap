using NHibernate;
using NHibernate.Cfg;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Service
{
    public static class Database
    {
        private static ISessionFactory _sessionFactory;
        private static ISessionFactory SessionFactory
        {
            get
            {
                if (_sessionFactory == null)
                {
                    var configuration = new Configuration();
                    var configurationPath = HttpContext.Current.Server.MapPath(@"~\Models\NHibernate.cfg.xml");
                    configuration.Configure(configurationPath);;
                    var ConfigurationFile = HttpContext.Current.Server.MapPath(@"~\Mapping\Repository.xml");
                    configuration.AddFile(ConfigurationFile);
                    _sessionFactory = configuration.BuildSessionFactory();

                }
                return _sessionFactory;
            }
        }
        public static ISession OpenSession()
        {
            return SessionFactory.OpenSession();
        }
    }
}