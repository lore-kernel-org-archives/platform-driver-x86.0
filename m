Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024728DB1
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwWzbll+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704391219; x=1735927219;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VLYuXjWsi8yBUgAad57l1lhiZKTswjDHXLJSN4K3FZ4=;
  b=PwWzbll+U1EZ2YSw04LKlZUWTuXJqgLl7rKlabpPzpkqEc0X5URCrRPy
   CsvLKqACClrStwYzz1Hq9cM0Q2ZKN4gAbhiDrRDTk/9Bs7xhgAjchNpoL
   67fwccMndNlQyYYF8dF6uLQLHVHYJlKRqOLkJW0xvMzaoGSj13Rm+Eg5X
   8DscenG5KUHubN7t/R0qvvo0/4Npt4lXpD+IshTENmlNVm06f3zTvIfwZ
   6BZA29t19hh6k7PtHeQeRf4apDISahMBuJtkECRN4th2S1DF2O6GroGjH
   Ckn8h/I1fnmdj6B8vPtFHigb56J7iy5dEwzMncwLlNjdCLI6xkdJIKMuG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463713523"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="463713523"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 10:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="1027523699"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="1027523699"
Received: from asebenix-mobl1.ger.corp.intel.com ([10.251.210.215])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 10:00:17 -0800
Date: Thu, 4 Jan 2024 20:00:15 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alexis Belmonte <alexbelm48@gmail.com>
cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support
 for 8BAD boards
In-Reply-To: <ZZFGgfsfrU2vuQoI@alexis-pc>
Message-ID: <e12b3ce3-f3e8-5d6f-ecb0-37f1e4778644@linux.intel.com>
References: <ZZFGgfsfrU2vuQoI@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 Dec 2023, Alexis Belmonte wrote:

> Add 8BAD to the list of boards which have thermal profile selection
> available. This allows the CPU to draw more power than the default TDP
> barrier defined by the 'balanced' thermal profile (around 50W), hence
> allowing it to perform better without being throttled by the embedded
> controller (around 130W).
> 
> We first need to set the HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET to zero.
> This prevents the timer countdown from reaching zero, making the embedded
> controller "force-switch" the system's thermal profile back to 'balanced'
> automatically.
> 
> We also need to put a number of specific flags in
> HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET when we're switching to another
> thermal profile:
> 
>    - for 'performance', we need to set both HP_OMEN_EC_FLAGS_TURBO and
>      HP_OMEN_EC_FLAGS_NOTIMER;
> 
>    - for 'balanced' and 'powersave', we clear out the register to notify
>      the system that we want to lower the TDP barrier as soon as possible.
> 
> The third flag defined in the hp_thermal_profile_omen_flags enum,
> HP_OMEN_EC_FLAGS_JUSTSET, is present for completeness.

I don't understand this. Based on the name of the flag, I'd have expected 
it has to be set (but its purpose is not known), but the code below does 
not do that?

> To prevent potential behaviour breakage with other Omen models, a
> separate omen_timed_thermal_profile_boards array has been added to list
> which boards expose this behaviour.
> 
> Performance benchmarking was done with the help of silver.urih.com and
> Google Chrome 120.0.6099.129, on Gnome 45.2, with the 'performance'
> thermal profile set:
> 
> |                  | Performance |     Stress |   TDP |
> |------------------|-------------|------------|-------|
> |    with my patch |      P84549 |    S0.1891 |  131W | 
> | without my patch |      P44084 |    S0.1359 |   47W |
> 
> The TDP measurements were done with the help of the s-tui utility,
> during the load.
> 
> There is still work to be done:
> 
>    - tune the CPU and GPU fans to better cool down and enhance
>      performance at the right time; right now, it seems that the fans are
>      not properly reacting to thermal/performance events, which in turn
>      either causes thermal throttling OR makes the fans spin way too long,
>      even though the temperatures have lowered down
> 
>    - expose the CPU and GPU fan curves to user-land so that they can be
>      controlled just like what the Omen Gaming Hub utility proposes to
>      its users;
> 
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 63 +++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 95282c3a02ed..79caf5d79e05 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -38,6 +38,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>  
> +#define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
> +#define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>  
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
> @@ -57,7 +59,7 @@ static const char * const omen_thermal_profile_boards[] = {
>  	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
>  	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
>  	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
> -	"8917", "8918", "8949", "894A", "89EB"
> +	"8917", "8918", "8949", "894A", "89EB", "8BAD"
>  };
>  
>  /* DMI Board names of Omen laptops that are specifically set to be thermal
> @@ -68,6 +71,14 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
>  	"8607", "8746", "8747", "8749", "874A", "8748"
>  };
>  
> +/* DMI board names of Omen laptops that have a thermal profile timer which will
> + * cause the embedded controller to set the thermal profile back to
> + * "balanced" when reaching zero.
> + */
> +static const char * const omen_timed_thermal_profile_boards[] = {
> +	"8BAD"
> +};
> +
>  /* DMI Board names of Victus laptops */
>  static const char * const victus_thermal_profile_boards[] = {
>  	"8A25"
> @@ -184,6 +194,12 @@ enum hp_thermal_profile_omen_v1 {
>  	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
>  };
>  
> +enum hp_thermal_profile_omen_flags {
> +	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
> +	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
> +	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
> +};
> +
>  enum hp_thermal_profile_victus {
>  	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
>  	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> @@ -451,7 +467,11 @@ static int hp_wmi_get_tablet_mode(void)
>  
>  static int omen_thermal_profile_set(int mode)
>  {
> -	char buffer[2] = {0, mode};
> +	/* The Omen Control Center actively sets the first byte of the buffer to
> +	 * 255, so let's mimic this behaviour to be as close as possible to
> +	 * the original software.
> +	 */
> +	char buffer[2] = {-1, mode};
>  	int ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> @@ -1203,6 +1221,28 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> +static bool has_omen_thermal_profile_ec_timer(void)
> +{
> +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(omen_timed_thermal_profile_boards,
> +			    ARRAY_SIZE(omen_timed_thermal_profile_boards),
> +			    board_name) >= 0;
> +}
> +
> +inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
> +{
> +	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
> +}
> +
> +inline int omen_thermal_profile_ec_timer_set(char value)

u8 ?

I know this driver uses char in many place but if this is binary data, u8 
is the correct type (and the other char instances should be converted 
to u8 too eventually).

> +{
> +	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
> +}
> +
>  static int platform_profile_omen_set(struct platform_profile_handler *pprof,
>  				     enum platform_profile_option profile)
>  {
> @@ -1240,6 +1280,24 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
>  	if (err < 0)
>  		return err;
>  
> +	if (has_omen_thermal_profile_ec_timer()) {
> +		err = omen_thermal_profile_ec_timer_set(0);
> +		if (err < 0)
> +			return err;
> +
> +		enum hp_thermal_profile_omen_flags flags;

Please put this to the usual place (beginning of the block or function).
I know it's now possible to place them anywhere because of what cleanup.h 
requires but lets not start to spread them all around just because we can,
it makes finding the declaration harder, you could also initialize to 0 
so you don't need the else branch below.

> +
> +		if (profile == PLATFORM_PROFILE_PERFORMANCE)
> +			flags = HP_OMEN_EC_FLAGS_NOTIMER |
> +				HP_OMEN_EC_FLAGS_TURBO;
> +		else
> +			flags = 0;
> +
> +		err = omen_thermal_profile_ec_flags_set(flags);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	return 0;
>  }


-- 
 i.

