Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395730;
	b=IRHvlkVTkFGxufcKm3jmqg5bWAwbGhLn+ApfiSbfA5zMm2OKAgu11TYCZ5ojstdYEsGa
	 GcBpV75kVC59AIDdjs/r+tsNglOlTfBS1PucbU0umML3YS3tHkgNpFrC7YAiYR2ST2maR
	 XoP5Sk11MQMK6WJqhsedAcML9261SKJp1bQN1XDCRInPY1LMX3x4wMto0nxwlN+Fesiq9
	 OojcITdD1fLuJfyJNH8tEO728RCyK4LGxUIzCDPDNbCAGR2hmgBDfkBq+XiRoxX7ds9+s
	 VNlIDJQdFpq6yVHEDtk8hzjP7+kuus04zSBntVkQoKq2rguKT9H6rcMhpwUiAmc/NPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Rk/Or+A2hVLusxWCw3wVAt7Tsp4Mo0Wjedz84BpaMmY=;
	b=cFouK//mTOOSdsVwv27ZP27XtKfKLdUU69EmtfSiR1dfLHV5s5S3/0NbqYk8gz5hY1SU
	 mJ+CZ7PnbJ3x5UPzTuxZuvFAfHv7L8egT8vnOJG75L25NZF3EK6/OpmWxBGADflOWE/xW
	 N1AtxfwfhbvzLDyq3gqezDYYM14xdPyzfIkSWBv822rsUCs3ipJxEu5gk3dpjWVX48ipR
	 4kp082Ds0qx2lutynEWezqhDMtcfjT5ss2bMUQHZQ/O0GuNL70jQGXQIddeyJ0TtiixmX
	 +nnI0msCzR0MpyCLTrtaP49RN4GSQUzCZ6A8i4hFsFRBGAXPsV5ux8iI+RboPVrFFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsx7KpX8;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E121606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 11:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E121606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsx7KpX8
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6289896eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395730; x=1795000530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rk/Or+A2hVLusxWCw3wVAt7Tsp4Mo0Wjedz84BpaMmY=;
        b=Qsx7KpX8tzcudncfssN3QfFwpo9MZ+ZW6qbAPgbzTgsnRKSj2cD0eFizh+I0ZEhGKi
         yqUqf69OMGRpxbUjCbA1ayMB8SC/U1SqZWId2fbCngjzj3oFe+QpDBfyXQXRaome2k1V
         b5AtX5tqiqzYSDYrvFdoKd4wM7YVYW4979hjMqYvP9ZjqLNtGsJuSP4aygk3cSvUkbbx
         7QKZYm2NmAhVkNzFudlx8XxYqDYZfs/9EM5c1rMCx7h4f+Zn22yw9qEd1drXMmih86Zw
         iyxwC5pcA2MpiJ5Q330BMW2OZZQvsnT2v/Nj4zK0UlsO9hY1pyIwTyZNTi7732wreux3
         KIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395730; x=1795000530;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk/Or+A2hVLusxWCw3wVAt7Tsp4Mo0Wjedz84BpaMmY=;
        b=UvevmtdPzAzQBU0PBOAzTSuLNpZ3c8iMo+jA6sPzwpW5mdt5eAnAFbp6vE5C7q6X9i
         dLG+WpjJobVVlvFLaXRByMJViXPXZvgIJBZUwcogf4ULQmxX35G6wnszYcCpwDRK0Uca
         AEqeSznIgyotk7PlSajnVxorS6uc4Olkm6pIsYMWzpfv/e6pLwr8GpgCf43Veua2cNJ9
         3vWXSJ3gmiWmXwpYQdHF6LQsGMmWUhHBS5Fs/gU4vPmfEC2G5TJN9Z8wELoaBJG8CwAi
         8ooicZ4ladXn+g2uIq6BbbfgXYwpi+YMAt7gBdR9ZaSEhuXMn5VY1S7eWLZJNyYQI/4Z
         /tnA==
X-Forwarded-Encrypted: i=1; AL+hErF21ksz0DVYOfM0GFazNouj4WVLH0SQzNQLSBA7mrMTAWeiNaKE5hTIUpry02XozE3n5c2u5DKHtM8RsBIrOSLe8Jyw@vger.kernel.org
X-Gm-Message-State: APuU4Z8z5Rezoco3QqZfzm8Mxha5trvi7pTDDr44yT0L4nrEmQbzrzVG
	+E2Dq0wrZr86wJupZrnYHfJBVO3MGVlpfk7kNC37STcxjcYPTbsabsbFeo5SWA==
X-Gm-Gg: AYBFou2zjXOfP0v5DOHnIvwn5Ht/Tob97r+6LsBlxLGt0cTd2A1cvkZu5ShSbR/fkao
	gUyP+M9NEbUE55CYsqTpupzG0ha8vaIoVPr8QOiLZq8G5aUFgaE1Ni1bKNlBHipMxR81LzyGj8c
	+tc7jJDST5QFenagz1weDLzXKR5Mjnu9lV7xW7MBIgAw4dm3rvQi/0ggKyDZrq7vPuivKQ7vOnx
	bQ+dOpNiqCh8VcZpaO5vXyK5QcrJcrKehueUHh/CB8MWOCDsSznfFveBkB9y1SdZznr3Rvt1fxC
	fOjjZkHkGetT6YrTWwhXSmshr/q7aQa9iVPZTadW9X6EUxAKMBIyQe2nfSsY4A7qLdRelnLkPr3
	KgC6ba14WgnIpLme+Beaya8lcRhQlbrpSxlToB47T+2vBkurb1olN3S92HJMjg3u9B02IcLqbiM
	D17GwV33VXuTmGofqXXGzPzpcdNbWONHpbNJ6TrGbDnWXi//NSK06R1m7mUrAd5MSk387BtZc3O
	SfNf+Rqm9iNTAcMl43MbzWRwcmGJj4OYLldqd9o+7a6L9g9W+ZqNWmO5Q0oOJkIxLixxmmIHAGN
	cSaa/CYoh2df4DnlOKFIiVz/PFKtj6Yy/i360GW8WLeLG7UEIAYGjwm/Vid+ZLDtHg+UPxR97pA
	5gkxOl451HS6X3lWxW9GQ1tA=
X-Received: by 2002:a05:7301:2907:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-376850ce224mr3701102eec.13.1794395729453;
        Wed, 11 Nov 2026 03:15:29 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm17598082eec.14.2026.11.11.03.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:15:28 -0800 (PST)
Date: Wed, 11 Nov 2026 03:15:30 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Rong Zhang <i@rong.moe>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/x86=3A_lenovo-wmi-oth?=
 =?US-ASCII?Q?er=3A_Deconflict_battery_with_thinkpad=5Facpi?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261111083529.727285-1-aaron.ma@canonical.com>
References: <20261111083529.727285-1-aaron.ma@canonical.com>
Message-ID: <36F5DA90-A839-4EC7-B916-517EBA565C1C@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 11, 2026 12:35:29 AM PST, Aaron Ma <aaron=2Ema@canonical=2Ecom>=
 wrote:
>ThinkPads expose battery charge thresholds and charge_behaviour through
>thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups=2E The
>Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
>charge_behaviour and charge_types on systems advertising those WMI
>capabilities=2E
>
>When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
>duplicate charge_behaviour sysfs attribute and unregisters its battery
>extension=2E Conversely, registering or updating any power_supply_ext on
>the same battery runs sysfs_update_groups(), which removes standard
>power-supply attributes not owned by power_supply_core and wipes out
>thinkpad_acpi's charge_control_start_threshold,
>charge_control_end_threshold, and charge_behaviour files=2E
>
>Match the existing ideapad_laptop deconfliction and skip registering
>the WMI battery extension when CONFIG_THINKPAD_ACPI is enabled and a
>ThinkPad ACPI hotkey device (LEN0268, LEN0068, or IBM0068) is present,
>unless overridden by force_load_psy_ext=2E
>
>Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery ch=
arge limiting")
>Signed-off-by: Aaron Ma <aaron=2Ema@canonical=2Ecom>
>---
> drivers/platform/x86/lenovo/wmi-other=2Ec | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index bd64e7b44669d=2E=2E6175f1e6c51a7 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -909,8 +909,9 @@ static acpi_status lwmi_acpi_match(acpi_handle handle=
, u32 lvl,
>  * lwmi_om_psy_ext_init() - Hooks power supply extension to device batte=
ry
>  * @priv: Pointer to the lwmi_om_priv drvdata=2E
>  *
>- * Checks if the ideapad_laptop driver is going to manage charge attribu=
tes first,
>- * then if not, hooks the battery to our WMI methods if they are support=
ed=2E
>+ * Checks if the thinkpad_acpi or ideapad_laptop driver is going to mana=
ge
>+ * charge attributes first, then if not, hooks the battery to our WMI me=
thods
>+ * if they are supported=2E
>  */
> static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> {
>@@ -928,6 +929,15 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv=
 *priv)
> 	if (force_load_psy_ext)
> 		goto load_psy_ext;
>=20
>+	/* Deconflict thinkpad_acpi driver */
>+	if (IS_ENABLED(CONFIG_THINKPAD_ACPI) &&
>+	    (acpi_dev_present("LEN0268", NULL, -1) ||
>+	     acpi_dev_present("LEN0068", NULL, -1) ||
>+	     acpi_dev_present("IBM0068", NULL, -1))) {
>+		dev_dbg(&priv->wdev->dev, "thinkpad_acpi driver manages battery for de=
vice\n");
>+		return;
>+	}
>+

Hi Aaron,

This doesn't validate that the methods exist on the Thinkpad device=2E Tha=
t could have us deferring to a driver that doesn't fully expose the battery=
 on some devices=2E After looking at tpacpi_battery_probe(), I think we can=
 rewrite this function to validate both the ideapad and thinkpad dicovery=
=2E

- Add a for loop to find a matching handle, include the existing ideapad h=
andle and the 3 thinkpad handles=2E
- Use acpi_has_method() to find if the feature is supported=2E If it's an =
ideapad handle, check for "GBMD" and "SBMC"=2E If it is a thinkpad handle, =
check for "GET_DISHCHARGE" and "GET_INHIBIT"=2E

For this I think we can make two const, over for each method pair, then ma=
ke a const struct list of method pairs and handles=2E That will allow you t=
o loop over the list to quickly find a matching handle, then use that index=
 to access the method names without looping a second time=2E The struct dec=
laration for this would keep it tidy and expandable=2E

Additionally, the comment & description for force_load_psy_ext needs to be=
 updated to include the thinkpad case with this change=2E

I do like the fact that you check for the config to be set first=2E That i=
s something the current implementation lacks=2E Perhaps a driver_config fie=
ld on the same struct could hold that data=2E Then each check becomes: do y=
ou have the handle -> do you have its methods -> is it configured=2E

Thanks,
- Derek

> 	/* Deconflict ideapad_laptop driver */
> 	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> 	if (ret)

