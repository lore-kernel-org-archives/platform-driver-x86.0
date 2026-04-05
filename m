Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B41A08BC;
	Sun,  5 Apr 2026 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348204; cv=none; b=WK6zTkQNT4XP4ed5S75H8SPWvLOS87foUDZLYXzVsgjTKO8TTvIot8M4XXeWwlPpO+IsIgyzg/WLFsPRno1ovtcD/s2hDhoebzRo3b3rlJf5+pqSxWJDSzhcpX7573TjYB1MNyV8TIjkbKkdiqNaoWlCo65QiuEA8R9FN9Q+fSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348204; c=relaxed/simple;
	bh=xmYxqfgaieXMlvNONokLRUmxBarSLDPHFbNUfdC7kfI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KqXX2glmQ8L8RSMhU94eUu5JDWIzKwtwHf69GoWm6Xi0rt4K42KPfzpOQXeifuLv5gFEtfdSvREPZIHtT9TY3gbX2olHiWrDJierlvp4TgtBT8YkOZaQizGCYV5NHYWWSLtWtuLWmTjfmY8F77FlDVKOec/2LY1T81eE48ZYRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Rh1FClt2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JZ4ZbLl0; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Rh1FClt2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JZ4ZbLl0"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D9B8C7A0169;
	Sat,  4 Apr 2026 20:16:41 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 04 Apr 2026 20:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775348201;
	 x=1775434601; bh=27d5QCx0pWgLccoMtjc03XLrvhcqaFwkIKywWopuRXc=; b=
	Rh1FClt2EZKM14OzeKI0VU9y3Y2uGDgbGYfASnhndYC/lCUK5aMAeH6EY/T42vt8
	uvQ02TS6jY8KmfbPHjr5fQngLl2P01omVsNlzAk5xs1g8JY/pWbt3VbRzINbMY7N
	BnusB262pGrehgbdZ24Ep8sQoijqAj3DBx86fQEgGwu8pRroZmiM75WnQ15uOeeL
	o5u2cYny05ND1MADRcBLH4W1dO8BhgCzWwqUQ4YKGh6IdmA75eecoSRLgwyQKuse
	BIR1Bz8skXkVD0iUdAdGfuIrzHb/ru6+/Fq6qm/yTV1KPIXhswbYMXJOeRvqfyJy
	uEKeTOPQklDMnLKFLI34jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775348201; x=
	1775434601; bh=27d5QCx0pWgLccoMtjc03XLrvhcqaFwkIKywWopuRXc=; b=J
	Z4ZbLl0YtxjgTcjWvU9q8oXRGvvg0hwZCDeOHG0iFJrnPlarc59HvvWJcKVmOUlj
	Ze8HJMgfluJv9E7jNZzQV5ZSI3727ZTTRuYf0/YeP2QSoSb3SmPsHYEvnjGOz3nI
	A/nPNiGm0glwwY3geGIhrK2Tg8y5/aGLYu11HovKNPqtHNaVIwEbUTqMFOLCf1W4
	DFqR5QrQwfVt4QSy3ha+FoO3aeu581PlSEmidnax+/Auxbr5PiaSYPR3MgxUizBW
	vo0gnZsH3yDMQXyeUaJlm3mI4SLN9apF+64UW3j99g/cn5kxkNBUZfpg6iG4RlEw
	KYuo4FwvntxmEq5qHaLbQ==
X-ME-Sender: <xms:6anRaWLBZaolHBcvbBB36DyLOKUGz8doF1At2FgGK44Ge8itox4-6g>
    <xme:6anRaY82-BZcfWaPOcyI1W2gBVopYMRSd3HhalUaXHusgsxeEjSBRKGeffDDSElUR
    NGa0XdWKR4Ezwp5xqqHMjFfwsBYpenQJIqyRCQGyKqgCe50zRVOTlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkh
    hjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehkuhhurhhtsges
    ghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtph
    htthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheptghorhgsvg
    htsehlfihnrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:6anRaYpPtaxWtKOwPP8stPZGZ3xQHE9DOZiAMttra-xTMGkCGm7kfA>
    <xmx:6anRabPArOWOA8QTwQXP4Tt_aWXxnx5gvTyu1XWbLKtdyh6n6VT3uw>
    <xmx:6anRaRoXWVLD2gMaw4YvSmKiVLy4gd11GZNmG-lqFgnmzRFQIVfzpg>
    <xmx:6anRaWszHSOIIQn8g2Lel3U7d6cOLtY_0xBzoNNTCvqAr0f4GRdJUA>
    <xmx:6anRafu7bzwimoymh6Ifij1q1Z85D_XVJAc2mLbluTugUzpsQM4DdYzI>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 425882CE3F96; Sat,  4 Apr 2026 20:16:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AoCcIK21by6-
Date: Sat, 04 Apr 2026 20:16:19 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b9b222fc-58d1-48b9-a918-867dd65d797f@app.fastmail.com>
In-Reply-To: <20260402032424.678528-11-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-11-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 10/16] platform/x86: lenovo-wmi-other: Add lwmi_attr_id()
 function
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Derek,

On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v7:
>   - Incorporate additional replacements in lwmi_attr_01_is_supported
>     after moving the patch that adds it to earlier in the series.
> v6:
>   - Move lwmi_attr_id to wmi-capdata.h as static inline.
> v5:
>   - Move references to cv/cd_mode_id to patch 4/8.
>   - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
> v4:
>   - Switch from macro to static inline to preserve types.
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c |  8 ++--
>  drivers/platform/x86/lenovo/wmi-capdata.h | 20 ++++++++
>  drivers/platform/x86/lenovo/wmi-other.c   | 56 ++++++++---------------
>  3 files changed, 43 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c 
> b/drivers/platform/x86/lenovo/wmi-capdata.c
> index ee1fb02d8e31..169665be4dcf 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -27,7 +27,6 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
>  #include <linux/acpi.h>
> -#include <linux/bitfield.h>
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
> @@ -48,6 +47,7 @@
>  #include <linux/wmi.h>
> 
>  #include "wmi-capdata.h"
> +#include "wmi-helpers.h"
> 
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> @@ -58,9 +58,9 @@
> 
>  #define LWMI_FEATURE_ID_FAN_TEST 0x05
> 
> -#define LWMI_ATTR_ID_FAN_TEST							\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> +#define LWMI_ATTR_ID_FAN_TEST                                      \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> 
>  enum lwmi_cd_type {
>  	LENOVO_CAPABILITY_DATA_00,
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h 
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 8c1df3efcc55..1388eaf4ab4a 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -6,6 +6,7 @@
>  #define _LENOVO_WMI_CAPDATA_H_
> 
>  #include <linux/bits.h>
> +#include <linux/bitfield.h>
>  #include <linux/types.h>
> 
>  #define LWMI_SUPP_VALID		BIT(0)
> @@ -19,6 +20,8 @@
> 
>  #define LWMI_DEVICE_ID_FAN	0x04
> 
> +#define LWMI_TYPE_ID_NONE 0x00
> +
>  struct component_match;
>  struct device;
>  struct cd_list;
> @@ -57,6 +60,23 @@ struct lwmi_cd_binder {
>  	cd_list_cb_t cd_fan_list_cb;
>  };
> 
> +/**
> + * lwmi_attr_id() - Formats a capability data attribute ID
> + * @dev_id: The u8 corresponding to the device ID.
> + * @feat_id: The u8 corresponding to the feature ID on the device.
> + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
> + * @type_id: The u8 corresponding to the sub-device.
> + *
> + * Return: u32.
> + */
> +static inline u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 
> type_id)
> +{
> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
> +}
> +
>  void lwmi_cd_match_add_all(struct device *master, struct 
> component_match **matchptr);
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct 
> capdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct 
> capdata01 *output);
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 25ddfd54f692..19a072bea2d4 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -27,7 +27,6 @@
>   */
> 
>  #include <linux/acpi.h>
> -#include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
> @@ -59,8 +58,6 @@
> 
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> 
> -#define LWMI_TYPE_ID_NONE 0x00
> -
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> 
> @@ -70,10 +67,9 @@
> 
>  #define LWMI_FAN_DIV 100
> 
> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> 
>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> @@ -616,12 +612,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
>  	u32 attribute_id;
>  	int value, ret;
> 
> -	attribute_id =
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
> -			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	attribute_id = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> 
>  	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -686,10 +678,8 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>  	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
>  		return -EBUSY;
> 
> -	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_mode_id) |
> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
> 
>  	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
> @@ -702,10 +692,8 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> 
> -	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_mode_id) |
> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>  	args.arg1 = value;
> 
>  	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -750,10 +738,8 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
>  	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
>  		mode = tunable_attr->cv_mode_id;
> 
> -	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
> 
>  	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
> @@ -794,10 +780,8 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
> 
>  	/* Determine tunable_attr->cd_mode_id*/
>  	for (i = 0; i < ARRAY_SIZE(modes); i++) {
> -		args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
> -			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +		args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +					 modes[i], tunable_attr->type_id);
> 
>  		ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  		if (ret || !capdata.supported)
> @@ -810,15 +794,10 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
>  	if (!cd_mode_found)
>  		return cd_mode_found;
> 
> -	dev_dbg(tunable_attr->dev,
> -		"cd_mode_id: %#010x\n", args.arg0);
> -
>  	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
>  	for (i = 0; i < ARRAY_SIZE(modes); i++) {
> -		args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
> -			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +		args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +					 modes[i], tunable_attr->type_id);
> 
>  		ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  					    (unsigned char *)&args, sizeof(args),
> @@ -833,7 +812,10 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
>  	if (!cv_mode_found)
>  		return cv_mode_found;
> 
> -	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support 
> level: %#010x\n",
> +	dev_dbg(tunable_attr->dev,
> +		"cd_mode_id: %#010x, cv_mode_id: %#010x, attribute support level: 
> %#010x\n",
> +		lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +			     tunable_attr->cd_mode_id, tunable_attr->type_id),
>  		args.arg0, capdata.supported);
> 

Minor comment, but I did wonder if it would be better to have two args in this function:
struct wmi_method_args_32 cv_mode_args = { 0x0, 0x0 };
struct wmi_method_args_32 cd_mode_args = { 0x0, 0x0 };

Just because later (patch 10) you end up having to do the calculation twice due to the dev_dbg call?

Mark
