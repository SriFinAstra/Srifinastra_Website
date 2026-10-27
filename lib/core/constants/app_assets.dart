/// Asset paths. Drop the real files into these locations — until then
/// every image shows a soft branded placeholder (see AppImage).
class AppAssets {
  AppAssets._();

  // Branding
  static const logo = 'assets/images/branding/sri_fin_astra_logo_v2.png';
  static const logoDark = 'assets/images/branding/sri_fin_astra_logo_dark.png';
  static const icon = 'assets/images/branding/sri_fin_astra_icon.png';
  static const monogram = 'assets/images/branding/sri_fin_astra_monogram.png';

  // Hero
  static const homeHero = 'assets/images/hero/home_hero.png';
  static const aboutHero = 'assets/images/general/about_us.png';
  static const servicesHero = 'assets/images/general/services.png';
  static const contactHero = 'assets/images/general/contact_us.png';
  static const ourStory = 'assets/images/general/our_story.png';

  // Services
  static const serviceTax = 'assets/images/general/tax.png';
  static const serviceAccounting = 'assets/images/general/accounting.png';
  static const serviceAudit = 'assets/images/general/auditing.png';
  static const serviceAdvisory = 'assets/images/general/advisory.png';
  static const serviceCorporate = 'assets/images/general/corporate.png';
  // static const serviceCorporate = 'assets/images/general/corporate.png';

  // General
  static const office = 'assets/images/general/office.webp';
  static const team = 'assets/images/general/team.webp';
  static const calculator = 'assets/images/general/calculator.webp';

  // Icons (SVG — add flutter_svg when you want to use these instead of
  // the Material icons used in v1)
  static const iconTax = 'assets/icons/tax.svg';
  static const iconAccounting = 'assets/icons/accounting.svg';
  static const iconAudit = 'assets/icons/audit.svg';
  static const iconAdvisory = 'assets/icons/advisory.svg';
  static const serviceGst = 'assets/images/general/gst.png';
}