Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E248C8B6
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002849; cv=none; b=O+jQiiF72gHZL4xE+RYJKvT/LUCURP0OLRPraBd0ELe292YZFI5AcmsIOWsb0+kYufdqBZJo9SqqX83BJMiGMZEZ3YGhXTBV5q8hCdl0IIrDSucxr6aTAmMcuf3dg8PQEkSUId/o66xSfMbVrba0gzKOoaGD9JQGdHJz/zjN9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002849; c=relaxed/simple;
	bh=/Wk0G6OMx58JB4J28VjOe9IKhJZt/KpmPk/ZuiImfiw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lYUrrUdp4LvBQT+EgNJ3EjYckchtI8CHvOXFryRqk5bDkyplzadHs5LdVQV3rcux2cEfqAymBzlNpnh0giRXSfwEsSF2++xLOkWqYN3neZSf0CTi5JtdB45A51be19sOnQdlpk6j+UZJqNVf5bxeG0grELTXlTUBaXkGifdO13Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTLW5FCq; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTLW5FCq"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so5578309eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 10:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778002847; x=1778607647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yhXVt+AnL0NfCyigv8QAWVK+PRj4tez0zQo7Ju/B5eA=;
        b=sTLW5FCqXp0+/11Q68AoJ1OphWr41fotHWQtWW2DGEBA9nvT7ONTHBmE3qt0wQ8j0m
         uX8TOo1pSo+hiCEnB7fh4LXAorHWjNJ0+p1wsTbHXzhgTF3rhU27rHy/77oTEN4rIiiN
         rvdoMHbTYKU5j0QAxSiPwlt8+Tu0sch9gQm4l4WHREkkqFyYYTJz0gGnEOk16CPjhACW
         bkJPNov2yK3AP52de3swyrETGduQ/r4lrAmXaP8n9ZrkjOgtFUgQwf5ThoqmFrlTsRbJ
         9Hl/ZivWaT+RPttcxczEMj+aqT+T+vXf70a+h2k79NB7+yxInZbQs0pEX4qeR281h3RL
         arnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002847; x=1778607647;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhXVt+AnL0NfCyigv8QAWVK+PRj4tez0zQo7Ju/B5eA=;
        b=DsoCJHASWjm1T3HgXxLl6R/U76OriOCEy/m0Wag7OgAw/Xojej1rmf2Ev3ztVQXfY+
         9FhNUalmrnVfa9FvQ7MYXs21lq9ZZoseTmTYxZAw1n/uZ86jHsV5SzsJJiekq36PXBC5
         V/zLDIIYYlsd7enh9eyPCLQOEhTV3nMk+fbzKLqMY8TkWEh0Mp/6JsIWkZrGmy0yiid3
         nLPugjoKAlIfgH1/PVj/LBs/aH19ok74wi7ws3HYpnhU/hTqAa1WDrU2UYEjvspgxiZy
         fEL7wNtQFDMgcQ9UVqzd0dPmgl5ydldfET2At+zF/3cChUk180Rh64TAbakbfkjTRYia
         NIqA==
X-Forwarded-Encrypted: i=1; AFNElJ+S1nUVI5Ie3EGgMuk7kC89x1XqiOfB1tgPOgLCPURxYxASBfT5ybV6SzR0c8aTWE10C26ACLQHzrd9PQ6MxUQp8eph@vger.kernel.org
X-Gm-Message-State: AOJu0YztdJhrYrkbWUyf/imH97RibQt20DhVrTMzW1bBcO2ztWEH7uoZ
	S4yVvUzdPw8ZExOJC3NE21ePcgX2NIWhzqZcD/OgGFhJUrA3dqO1DtKE
X-Gm-Gg: AeBDies6A8N4vOuAKhMjmsAySHO3MJHvInuc1LCdEfrDo3gwOhCAOk9mZBlsoxVhNtu
	pOBP3Lb6R0DcF+7OU77p4OrLv/Nmo1UINBDcWAEo8ZDFz06NOg9ncl1TGZbFW6rZa9vdNcjx+vd
	5LvnoBt3Z8NRw7iYS0XwBGkj6va3SZj1Qxv1EMUN10QcAFdVh0Nsc8zLgoA+WfwhVlL9HyicqyS
	i/seYIUnN/jLWH7bXOAKjRl1+AGxmDCeP+fwpUjWvyA1veFDECELFVIdN8VuHYv6MH+BK8UYQMT
	Mnc7IeBws82rpTHxlfzK0KdzwVbomEiQjMP/HIhYflAzf4lWPQ6EqQ/pfXLhVnsH8KKcGgJ6ia/
	a30bQ6fHf3ACwRRHRXCqb0VLXg3Kyyftbky2a7LBWrhqJQiAVYUkt8PojsaLKBd+jb3YDnk9yui
	8vb5usVB+YWOl9nDHIgZ+iytSSRuUbfCZd9ZOUbWiYvDHq7+KJv0fu8zqgGeFSfJw8/xAozOsU8
	NbzqOelJHHJv9GcykhUPkq0AzkgQEiz
X-Received: by 2002:a05:7300:7255:b0:2d4:aa5a:391c with SMTP id 5a478bee46e88-2f54869a41bmr127551eec.12.1778002846955;
        Tue, 05 May 2026 10:40:46 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bb60811sm20995714eec.24.2026.05.05.10.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:40:46 -0700 (PDT)
Date: Tue, 05 May 2026 10:40:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v10_06/16=5D_platform/x86=3A_lenovo-wmi-ot?=
 =?US-ASCII?Q?her=3A_Limit_adding_attributes_to_supported_devices?=
User-Agent: Thunderbird for Android
In-Reply-To: <3032887f-bfa2-6968-7a8e-db141e5ef649@linux.intel.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com> <20260412211121.2220556-7-derekjohn.clark@gmail.com> <1ce1d6f6-9196-c8a1-913d-4bdec2b1af80@linux.intel.com> <AA4D5F92-E158-48D1-85FC-CAA72A4EDD8A@gmail.com> <3032887f-bfa2-6968-7a8e-db141e5ef649@linux.intel.com>
Message-ID: <6ABDB1EF-324B-48EB-A5F2-18E13DD9F5B8@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 5, 2026 2:48:08 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linux=
=2Eintel=2Ecom> wrote:
>On Thu, 30 Apr 2026, Derek J=2E Clark wrote:
>> On April 30, 2026 7:01:55 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen=
@linux=2Eintel=2Ecom> wrote:
>> >On Sun, 12 Apr 2026, Derek J=2E Clark wrote:
>> >
>> >> Adds lwmi_is_attr_01_supported, and only creates the attribute subfo=
lder
>> >> if the attribute is supported by the hardware=2E Due to some poorly
>> >> implemented BIOS this is a multi-step sequence of events=2E This is
>> >> because:
>> >> - Some BIOS support getting the capability data from custom mode (0x=
ff),
>> >>   while others only support it in no-mode (0x00)=2E
>> >> - Some BIOS support get/set for the current value from custom mode (=
0xff),
>> >>   while others only support it in no-mode (0x00)=2E
>> >> - Some BIOS report capability data for a method that is not fully
>> >>   implemented=2E
>> >> - Some BIOS have methods fully implemented, but no complimentary
>> >>   capability data=2E
>> >>=20
>> >> To ensure we only expose fully implemented methods with correspondin=
g
>> >> capability data, we check each outcome before reporting that an
>> >> attribute can be supported=2E
>> >>=20
>> >> Checking for lwmi_is_attr_01_supported during remove is not done to
>> >> ensure that we don't attempt to call cd01 or send WMI events if one =
of
>> >> the interfaces being removed was the cause of the driver unloading=
=2E
>> >>=20
>> >> Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver=
")
>> >> Reported-by: Kurt Borja <kuurtb@gmail=2Ecom>
>> >> Closes: https://lore=2Ekernel=2Eorg/platform-driver-x86/DG60P3SHXR8H=
=2E3NSEHMZ6J7XRC@gmail=2Ecom/
>> >> Cc: stable@vger=2Ekernel=2Eorg
>> >> Reviewed-by: Rong Zhang <i@rong=2Emoe>
>> >> Tested-by: Rong Zhang <i@rong=2Emoe>
>> >> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> >> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> >> ---
>> >> v7:
>> >>   - Move earlier in the series=2E This required dropping the use of
>> >>     lwmi_attr_id as it will be added later=2E
>> >>   - Add missing switch between cd_mode_id and cv_mode_id in
>> >>     current_value_store=2E
>> >> v6:
>> >>   - Zero initialize args in lwmi_is_attr_01_supported=2E
>> >>   - Fix formatting=2E
>> >> v5:
>> >>   - Move cv/cd_mode_id refrences from path 3/4=2E
>> >>   - Add missing import for ARRAY_SIZE=2E
>> >>   - Make lwmi_is_attr_01_supported return bool instead of u32=2E
>> >>   - Various formatting fixes=2E
>> >> v4:
>> >>   - Use for loop instead of backtrace gotos for checking if an attri=
bute
>> >>     is supported=2E
>> >>   - Add include for dev_printk=2E
>> >>   - Wrap dev_dbg in lwmi_is_attr_01_supported earlier=2E
>> >>   - Don't use symmetric cleanup of attributes in error states=2E
>> >> ---
>> >>  drivers/platform/x86/lenovo/wmi-gamezone=2Eh |   1 +
>> >>  drivers/platform/x86/lenovo/wmi-other=2Ec    | 114 ++++++++++++++++=
++---
>> >>  2 files changed, 98 insertions(+), 17 deletions(-)
>> >>=20
>> >> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone=2Eh b/drivers/=
platform/x86/lenovo/wmi-gamezone=2Eh
>> >> index 6b163a5eeb95=2E=2Eddb919cf6c36 100644
>> >> --- a/drivers/platform/x86/lenovo/wmi-gamezone=2Eh
>> >> +++ b/drivers/platform/x86/lenovo/wmi-gamezone=2Eh
>> >> @@ -10,6 +10,7 @@ enum gamezone_events_type {
>> >>  };
>> >> =20
>> >>  enum thermal_mode {
>> >> +	LWMI_GZ_THERMAL_MODE_NONE =3D	   0x00,
>> >>  	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
>> >>  	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
>> >>  	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
>> >> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/pla=
tform/x86/lenovo/wmi-other=2Ec
>> >> index 50a03f5fd6ab=2E=2E29d062a1c6dc 100644
>> >> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> >> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> >> @@ -550,6 +550,8 @@ struct tunable_attr_01 {
>> >>  	u8 feature_id;
>> >>  	u8 device_id;
>> >>  	u8 type_id;
>> >> +	u8 cd_mode_id; /* mode arg for searching capdata */
>> >> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>> >>  };
>> >> =20
>> >>  static struct tunable_attr_01 ppt_pl1_spl =3D {
>> >> @@ -775,7 +777,6 @@ static ssize_t attr_current_value_store(struct k=
object *kobj,
>> >>  	struct wmi_method_args_32 args =3D {};
>> >>  	struct capdata01 capdata;
>> >>  	enum thermal_mode mode;
>> >> -	u32 attribute_id;
>> >>  	u32 value;
>> >>  	int ret;
>> >> =20
>> >> @@ -786,13 +787,12 @@ static ssize_t attr_current_value_store(struct=
 kobject *kobj,
>> >>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>> >>  		return -EBUSY;
>> >> =20
>> >> -	attribute_id =3D
>> >> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> >> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> >> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> >> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> >> +	args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->de=
vice_id) |
>> >> +		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) =
|
>> >> +		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_mode_id) =
|
>> >> +		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> >> =20
>> >> -	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata=
);
>> >> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata)=
;
>> >>  	if (ret)
>> >>  		return ret;
>> >> =20
>> >> @@ -803,7 +803,10 @@ static ssize_t attr_current_value_store(struct =
kobject *kobj,
>> >>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>> >>  		return -EINVAL;
>> >> =20
>> >> -	args=2Earg0 =3D attribute_id;
>> >> +	args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->de=
vice_id) |
>> >> +		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) =
|
>> >> +		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_mode_id) =
|
>> >> +		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> >
>> >It's already repeated a few times and you're adding more in this patch=
=2E
>> >
>> >We should have a helper function for this encoding as it seems to=20
>> >repeat=2E That is, something that takes tunable_attr and mode as input
>> >(the conversion of existing entries should be in own patch preceeding=
=20
>> >this fix patch)=2E
>> >
>>=20
>> Hi Ilpo,
>>=20
>> A function for that is added in patch 10, though it is slightly modifie=
d=20
>> from that to be more flexible is tunable_attr isn't used (such as with=
=20
>> the fan test attributes)
>
>It still leaves some boilerplate having to deref all those tunable_attr=
=20
>fields so perhaps it would be better to do nested helpers, one taking=20
>tunable_attr and that calls the more flexible helper=2E IMO that would be=
=20
>the best approach here=2E
>

That's simple enough=2E I assume that can be added to that same patch inst=
ead of an additional one?

- Derek

>> Originally I had that patch preceding any additions, but after=20
>> discussing with Rong we felt like it would be easier for stable=20
>> backports if all the fixes were upfront=2E I can certainly move it back=
=20
>> if you still prefer=2E
>
>I see=2E This patch would be cleaner though if we have the helper already=
 in=20
>place but I'm not insisting if you two prefer the current order of the=20
>patches=2E
>

