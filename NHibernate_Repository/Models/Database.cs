using NHibernate;
using NHibernate.Cfg;
using System.Web;

namespace nhibernate.Models
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
                    var configurationPath = HttpContext.Current.Server.MapPath(@"~\Models\hibernate.cfg.xml");
                    configuration.Configure(configurationPath);
                    //var bookConfigurationFile = HttpContext.Current.Server.MapPath(@"~\Mappings\Book.hbm.xml");
                    var customersConfigurationFile = HttpContext.Current.Server.MapPath(@"~\Mappings\Customer.hbm.xml");
                    //var ordersConfigurationFile = HttpContext.Current.Server.MapPath(@"~\Mappings\Orders.hbm.xml");
                    //configuration.AddFile(bookConfigurationFile);
                    configuration.AddFile(customersConfigurationFile);
                    
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