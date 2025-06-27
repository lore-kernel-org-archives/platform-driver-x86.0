Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC8294A11
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015684; cv=none; b=ax2G2TEEVyGv9vdjHKxJ8YzofNhgAlQ0Dyr7HDfZeXYfzMm4jNZPcz6aBCIU5vVnI/GbEro8XQlhq7RMaV9W3M9SLd2O4OLt/ll33/3UatFi5VqE8YFgwFov2sRniTykTUpu7raAkiXOE1lZPvjrQA+sq8tIMABsJjcDrHsSHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015684; c=relaxed/simple;
	bh=3nEIgJCmjlqaSQIOu2o6gKbPqljz6zUwsumBh5ajMUM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t9QIR4KnetQhYcrrbtJpaOB+SHUpVQnMWoUf1eWxNS7v0qImH/6IPYmdTJSKxbJssBrf+qm8nhVPzaZPFABonEfHqQAYQBisXatoQOu+K6wrSH0n7QJ3BetrUwMGviO9l6g2rNrwdmNeLvskqWJj/ovxjeve8njVwl4ObgbvX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXGRrDEa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXGRrDEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751015683; x=1782551683;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3nEIgJCmjlqaSQIOu2o6gKbPqljz6zUwsumBh5ajMUM=;
  b=DXGRrDEaztuIYpgwvCRaftBH4xg/HvSw+BLBUUm8kH4kmqQZeVTzXp17
   uCDIu3O2skC93RSoqWYdfWy9/pAKLSaAu80te7mRh1Uz+dFLY1Td0umrM
   EpZW6hm6MdEYkw1ic7YaXl6maRVKQsyw9dneSP40+Lb1UHIQ69uURZEEF
   yoEYfUmoXUMC1g6jL1UhEuMqR5XrBH+apZKdu4LQkMyK/kl66W4iiIEnX
   dfQ8ZrdfdR2O/48ZTlBzpLlyedakmEcBr8i35TTAKVe6D4yNo73NBqBsc
   SYsuU7q9MXjp+LIZCBNNaSl40S2arExYGYXM8n3HGhxizN8SBYYqzp+Cf
   A==;
X-CSE-ConnectionGUID: L9+9SnaMRey0XegHCS6ORg==
X-CSE-MsgGUID: xZCuOSqGSsWR2Jd9ECzhCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="75871732"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="75871732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:14:42 -0700
X-CSE-ConnectionGUID: y/qN6GcXQM6iJxDvamcKnA==
X-CSE-MsgGUID: cDUhJcz8SFumr4JwL4KsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152499931"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:14:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Jun 2025 12:14:36 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: x86-android-tablets: Add
 generic_lipo_4v2_battery info
In-Reply-To: <96d47457-cc87-46ed-ae9f-75f2fbcff76c@kernel.org>
Message-ID: <ba75eff2-1d69-6a23-2248-25fd8a26163d@linux.intel.com>
References: <20250609104620.25896-1-hansg@kernel.org> <96d47457-cc87-46ed-ae9f-75f2fbcff76c@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Jun 2025, Hans de Goede wrote:

> Hi Ilpo,
> 
> This series seems to have fallen through the cracks ?

Thanks for the heads up, it had indeed been marked as superceded in the 
patchwork for a reason I don't know, perhaps I had confused it with some 
other series or mismarked checkboxes in the interface.

I've restored its state now to New so I won't forget it again.

-- 
 i.

> If you're waiting for a review, both patches already have
> a Reviewed-by from Andy given to the v1 series, this v2 just
> fixes a small nitpick from Andy's v1 review in patch 2/2.
> 
> And the matching ug3105 driver changes have already landed in:
> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/log/?h=for-next
> 
> Regards,
> 
> Hans
> 
> 
> 
> On 9-Jun-25 12:46 PM, Hans de Goede wrote:
> > Move the asus_tf103c_battery_node to shared-psy-info.c and rename it to
> > generic_lipo_4v2_battery_node.
> > 
> > This is a preparation patch for adding ovc-capacity-table info to
> > the battery nodes.
> > 
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > ---
> >  .../platform/x86/x86-android-tablets/asus.c   | 21 +++----------------
> >  .../x86/x86-android-tablets/shared-psy-info.c | 16 ++++++++++++++
> >  .../x86/x86-android-tablets/shared-psy-info.h |  1 +
> >  3 files changed, 20 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
> > index 7dde63b9943f..97cd14c1fd23 100644
> > --- a/drivers/platform/x86/x86-android-tablets/asus.c
> > +++ b/drivers/platform/x86/x86-android-tablets/asus.c
> > @@ -206,24 +206,9 @@ static const struct software_node asus_tf103c_touchscreen_node = {
> >  	.properties = asus_tf103c_touchscreen_props,
> >  };
> >  
> > -static const struct property_entry asus_tf103c_battery_props[] = {
> > -	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
> > -	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
> > -	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
> > -	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
> > -	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
> > -	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
> > -	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
> > -	{ }
> > -};
> > -
> > -static const struct software_node asus_tf103c_battery_node = {
> > -	.properties = asus_tf103c_battery_props,
> > -};
> > -
> >  static const struct property_entry asus_tf103c_bq24190_props[] = {
> >  	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
> > -	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
> > +	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
> >  	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
> >  	PROPERTY_ENTRY_BOOL("omit-battery-class"),
> >  	PROPERTY_ENTRY_BOOL("disable-reset"),
> > @@ -236,7 +221,7 @@ static const struct software_node asus_tf103c_bq24190_node = {
> >  
> >  static const struct property_entry asus_tf103c_ug3105_props[] = {
> >  	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
> > -	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
> > +	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
> >  	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
> >  	{ }
> >  };
> > @@ -321,6 +306,6 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
> >  	.gpio_button = &asus_me176c_tf103c_lid,
> >  	.gpio_button_count = 1,
> >  	.gpiod_lookup_tables = asus_tf103c_gpios,
> > -	.bat_swnode = &asus_tf103c_battery_node,
> > +	.bat_swnode = &generic_lipo_4v2_battery_node,
> >  	.modules = bq24190_modules,
> >  };
> > diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> > index a46fa15acfb1..55da57477153 100644
> > --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> > +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> > @@ -39,6 +39,22 @@ const struct software_node fg_bq25890_supply_node = {
> >  	.properties = fg_bq25890_supply_props,
> >  };
> >  
> > +/* Standard LiPo (max 4.2V) settings used by most devs with a LiPo battery */
> > +static const struct property_entry generic_lipo_4v2_battery_props[] = {
> > +	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
> > +	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
> > +	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
> > +	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
> > +	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
> > +	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
> > +	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
> > +	{ }
> > +};
> > +
> > +const struct software_node generic_lipo_4v2_battery_node = {
> > +	.properties = generic_lipo_4v2_battery_props,
> > +};
> > +
> >  /* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV battery */
> >  static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
> >  	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
> > diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > index c2d2968cddc2..bcf9845ad275 100644
> > --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > @@ -21,6 +21,7 @@ extern const char * const bq25890_psy[];
> >  
> >  extern const struct software_node fg_bq24190_supply_node;
> >  extern const struct software_node fg_bq25890_supply_node;
> > +extern const struct software_node generic_lipo_4v2_battery_node;
> >  extern const struct software_node generic_lipo_hv_4v35_battery_node;
> >  
> >  extern struct bq24190_platform_data bq24190_pdata;
> 
