Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180BEC4;
	Sun, 29 Dec 2024 00:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735432219; cv=none; b=k8taxgi4cJ+hJDp0uH7L2teWETqeGf/icaqMjnwtLuzZ0daClt79JzJDaiiGyHmu5hw9lcoB0CCnuo37bMIqowsqLvehzcel+D1G2O4W6nTWxVXLAuz64xCV6rRr/CZkofjuo5QQCklEe1eyJcP7zzVSONQrGjlzpUPQCNcchAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735432219; c=relaxed/simple;
	bh=MblTFoaTkB+FU4TzzMfg8TzEo7EfZmLu8dhYEG1Gce8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCwVR2jE/mZ154p/Vjjrw/Wo4HKnEiDA3fuvN4wKZvKX54nPESMOxeNhq5Gve1eoQknaQoqxx2R6DVZIA1k98m1wtHYB2Vva4Xna6XL2GB2CGdwQr2Q0J8A4xaon9A1r5ms6F/QO9xkIcJB62d0pT227zb0mQN0F2Cm3Y+TEZnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=h8edbacK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="h8edbacK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735432203; x=1736037003; i=w_armin@gmx.de;
	bh=jCACReCxZng0mo0JuT2W50xTnFaOffGK242w292IGB8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h8edbacKGJgnOgVgT5I8PjMhC9BhdQfzG66icsoWqI0C7jGTBOtDuDjOD/OFs+P7
	 AIkL6grppwH5YKjgq4vZbKS8izi1XcyEYC6R4zGLBrAdOuNZEXuQpjyc0lAYzfkH5
	 XlBfAgO2Hkz96HloQ+8jXEVkR5Z4teHYuqkUMqbi8xGA1TA8JIv+pbAKGd+TCkSMK
	 Wer5op1rVS3Th92wNIBKlrTwFuLhKRKiGmBzRqJTiwTlhDX9MbQZyvVAHIR/yAilM
	 HXBzx0DQKjbGmZ8qeLZ5wT/lkXMlr5d4kUV7WGwM0Rnb6huXCa4AFAHEkxElzWmxm
	 Yb8lnpRFLBzJVtOr8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1t1Oup0yh6-00Rrzl; Sun, 29
 Dec 2024 01:30:03 +0100
Message-ID: <5f71df0f-fd74-47e8-9044-b274f6f7f68c@gmx.de>
Date: Sun, 29 Dec 2024 01:30:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] alienware-wmi: Split DMI table
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-14-kuurtb@gmail.com>
 <02ff9ba4-87d2-436f-bf2a-33b4296505dd@gmx.de>
 <r2yoc6dmpjvl2ihhlnj7ppylq5ykaibz2mpb6roezimmkxwmyv@q6uc27vjf5t3>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <r2yoc6dmpjvl2ihhlnj7ppylq5ykaibz2mpb6roezimmkxwmyv@q6uc27vjf5t3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dGss5YJMg2zHDvBpF9XQ2GMZzxLJo1qxiICdzWxCMS7Le0+gMxJ
 C5qmwuXR6LjO29nmg4gkxiMaDCLIO50f3p0YOETxoO+DJxXgviGs36IU8zUsuydxPqQrTyF
 IZwVZ56EvrdNpkjMnLG0nPA0ZwTGJHiVa2TVjhyQdtXtgO0lQzBMRaCy35+Kh390AiZs8j6
 EFvdow+f9p7BhmAsqFPuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ne54I7X4o60=;HfD3hrUwUIwhk5kY3M4v7s/t1HP
 Jg/AcumNQcA9nHrsxb/ktHNy7aH2/F3su+BvRsFy9KjEKXqhZDYVu4aGO+RPUczpg+UhdtHOB
 Z0rw3ZHa9yOT4AhbnordAR3clKoysEBu1heO/M3dc4z8kixnFw9pBb+Xo3wRMUbUC2QFvGfb2
 tszYS7UtRciZc0fFzjVgqZj3AzWMhWhTb9Cv4I3KgMNDiztkwWRS2SpFWVg/ogFCJTG7r4pea
 ONs0PuJF+HdTu5MtyJG9nOjdyFdFANNn8+K7yk2wqjnTxw9qr/r2Okl4cqYx2tzrWHb4YePPu
 UNM6HIfiuI3Df6fp/WpZO/cYHkli04lNK9IzWzJXIHpAz0wvAxg4hmONJQ8yIFE81F6fcULeW
 MdW+uvdtgHOHIemXK0MNWsGkTE1mNQMg+v36kugPqOr3cXTzrujDRADXWuUcboXDjyp2tfGi8
 d3tmTayP8VtfVbRmpLyA/P8AGnLh9DWO1ZE4zsY9yFIv8sJwqNgcss+3wHrpKq6cqgXmm1NeX
 wUkkroJG/6qXxR64/yTSuw9TOeBTilcLaXQarKpB0oQAV3gQCizTlmB7NjVXleYTQOSdreg3o
 2F2B82wZEaLWnq1X8VExOinqZisq4K/a4lXZuTnGozaHKbKlxX6ju3JPQf/uipbSy8WBgdWQG
 2o4uSpO0As6tLYq3OlHvt/0NFWoOw3IryGHQRcaXoYVMfM7eNRlD2w4m4IBd9FPWzG99oOnhD
 aFhp7xKzfHTaTRt5Jc/8hbKqC77SOSy0aS31KoeAqtT7H1O0DZTi2lB9yTSV5xC17r55PSL23
 RJULBd6Go/MTxs9bBRFzSPQ5r89uVFvr5btp8V0MFvCwPEiwQyDEF3dpQ7mkMEVJokTl739Bq
 7Fe7bw51g3TUguDzDWGJe7S2UmlXTVIVXKbXnMWtbS31+D/M3NQKY24xlg/50cgGXl1xso9Xx
 JSyUVYvcTT8QxwHIK38gdSJFJ0vScd62YONEIaTwKAtSqBgxawhiF319xCewCGKFnSyqvKvck
 UtTgVQgcTRawvsdu4x7Y9SCY/XAbdWJNyYYFAZii8Y9pvQKjQki6FnsUS0vVCX2DsbyZVnQhL
 /UdvsB1OBnHWk63h9puRuQ8sRwNndc

Am 27.12.24 um 05:55 schrieb Kurt Borja:

> On Fri, Dec 27, 2024 at 04:55:28AM +0100, Armin Wolf wrote:
>> Am 21.12.24 um 06:59 schrieb Kurt Borja:
>>
>>> Split thermal features into a new DMI table to support upcoming file
>>> split.
>> Could it be that you also decided to reorder the quirk entries?
> No. I'll make this split lower in the file, so it doesn't mess up the
> diff.
>
> If I did reorder it by accident I will fix it.

OK, having a clear diff would make it easier to verify that no quirk entries have been changed.

Thanks,
Armin Wolf

>
>> Thanks,
>> Armin WOlf
>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/dell/alienware-wmi.c | 163 +++++++++-------------
>>>    1 file changed, 69 insertions(+), 94 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
>>> index 0a0b72dc61ea..8ea08f5f8810 100644
>>> --- a/drivers/platform/x86/dell/alienware-wmi.c
>>> +++ b/drivers/platform/x86/dell/alienware-wmi.c
>>> @@ -118,8 +118,6 @@ struct quirk_entry {
>>>    	u8 hdmi_mux;
>>>    	u8 amplifier;
>>>    	u8 deepslp;
>>> -	bool thermal;
>>> -	bool gmode;
>>>    };
>>>
>>>    static struct quirk_entry *quirks;
>>> @@ -130,8 +128,6 @@ static struct quirk_entry quirk_inspiron5675 = {
>>>    	.hdmi_mux = 0,
>>>    	.amplifier = 0,
>>>    	.deepslp = 0,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static struct quirk_entry quirk_unknown = {
>>> @@ -139,8 +135,6 @@ static struct quirk_entry quirk_unknown = {
>>>    	.hdmi_mux = 0,
>>>    	.amplifier = 0,
>>>    	.deepslp = 0,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static struct quirk_entry quirk_x51_r1_r2 = {
>>> @@ -148,8 +142,6 @@ static struct quirk_entry quirk_x51_r1_r2 = {
>>>    	.hdmi_mux = 0,
>>>    	.amplifier = 0,
>>>    	.deepslp = 0,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static struct quirk_entry quirk_x51_r3 = {
>>> @@ -157,8 +149,6 @@ static struct quirk_entry quirk_x51_r3 = {
>>>    	.hdmi_mux = 0,
>>>    	.amplifier = 1,
>>>    	.deepslp = 0,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static struct quirk_entry quirk_asm100 = {
>>> @@ -166,8 +156,6 @@ static struct quirk_entry quirk_asm100 = {
>>>    	.hdmi_mux = 1,
>>>    	.amplifier = 0,
>>>    	.deepslp = 0,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static struct quirk_entry quirk_asm200 = {
>>> @@ -175,8 +163,6 @@ static struct quirk_entry quirk_asm200 = {
>>>    	.hdmi_mux = 1,
>>>    	.amplifier = 0,
>>>    	.deepslp = 1,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static struct quirk_entry quirk_asm201 = {
>>> @@ -184,26 +170,6 @@ static struct quirk_entry quirk_asm201 = {
>>>    	.hdmi_mux = 1,
>>>    	.amplifier = 1,
>>>    	.deepslp = 1,
>>> -	.thermal = false,
>>> -	.gmode = false,
>>> -};
>>> -
>>> -static struct quirk_entry quirk_g_series = {
>>> -	.num_zones = 2,
>>> -	.hdmi_mux = 0,
>>> -	.amplifier = 0,
>>> -	.deepslp = 0,
>>> -	.thermal = true,
>>> -	.gmode = true,
>>> -};
>>> -
>>> -static struct quirk_entry quirk_x_series = {
>>> -	.num_zones = 2,
>>> -	.hdmi_mux = 0,
>>> -	.amplifier = 0,
>>> -	.deepslp = 0,
>>> -	.thermal = true,
>>> -	.gmode = false,
>>>    };
>>>
>>>    static int __init dmi_matched(const struct dmi_system_id *dmi)
>>> @@ -242,133 +208,140 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>>>    	},
>>>    	{
>>>    		.callback = dmi_matched,
>>> -		.ident = "Alienware m17 R5",
>>> +		.ident = "Alienware X51 R1",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
>>>    		},
>>> -		.driver_data = &quirk_x_series,
>>> +		.driver_data = &quirk_x51_r1_r2,
>>>    	},
>>>    	{
>>>    		.callback = dmi_matched,
>>> -		.ident = "Alienware m18 R2",
>>> +		.ident = "Alienware X51 R2",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
>>>    		},
>>> -		.driver_data = &quirk_x_series,
>>> +		.driver_data = &quirk_x51_r1_r2,
>>>    	},
>>>    	{
>>>    		.callback = dmi_matched,
>>> -		.ident = "Alienware x15 R1",
>>> +		.ident = "Alienware X51 R3",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
>>>    		},
>>> -		.driver_data = &quirk_x_series,
>>> +		.driver_data = &quirk_x51_r3,
>>>    	},
>>>    	{
>>>    		.callback = dmi_matched,
>>> -		.ident = "Alienware x17 R2",
>>> +		.ident = "Dell Inc. Inspiron 5675",
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
>>> +		},
>>> +		.driver_data = &quirk_inspiron5675,
>>> +	},
>>> +	{}
>>> +};
>>> +
>>> +struct awcc_features {
>>> +	bool gmode;
>>> +};
>>> +
>>> +static struct awcc_features g_series_features = {
>>> +	.gmode = true,
>>> +};
>>> +
>>> +static struct awcc_features x_series_features = {
>>> +	.gmode = false,
>>> +};
>>> +
>>> +static const struct dmi_system_id awcc_dmi_table[] __initconst = {
>>> +	{
>>> +		.ident = "Alienware m17 R5",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
>>>    		},
>>> -		.driver_data = &quirk_x_series,
>>> +		.driver_data = &x_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>> -		.ident = "Alienware X51 R1",
>>> +		.ident = "Alienware m18 R2",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
>>>    		},
>>> -		.driver_data = &quirk_x51_r1_r2,
>>> +		.driver_data = &x_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>> -		.ident = "Alienware X51 R2",
>>> +		.ident = "Alienware x15 R1",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
>>>    		},
>>> -		.driver_data = &quirk_x51_r1_r2,
>>> +		.driver_data = &x_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>> -		.ident = "Alienware X51 R3",
>>> +		.ident = "Alienware x17 R2",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
>>>    		},
>>> -		.driver_data = &quirk_x51_r3,
>>> +		.driver_data = &x_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>>    		.ident = "Dell Inc. G15 5510",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>    			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
>>>    		},
>>> -		.driver_data = &quirk_g_series,
>>> +		.driver_data = &g_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>>    		.ident = "Dell Inc. G15 5511",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>    			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
>>>    		},
>>> -		.driver_data = &quirk_g_series,
>>> +		.driver_data = &g_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>>    		.ident = "Dell Inc. G15 5515",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>    			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
>>>    		},
>>> -		.driver_data = &quirk_g_series,
>>> +		.driver_data = &g_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>>    		.ident = "Dell Inc. G3 3500",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>    			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
>>>    		},
>>> -		.driver_data = &quirk_g_series,
>>> +		.driver_data = &g_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>>    		.ident = "Dell Inc. G3 3590",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>    			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
>>>    		},
>>> -		.driver_data = &quirk_g_series,
>>> +		.driver_data = &g_series_features,
>>>    	},
>>>    	{
>>> -		.callback = dmi_matched,
>>>    		.ident = "Dell Inc. G5 5500",
>>>    		.matches = {
>>>    			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>    			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
>>>    		},
>>> -		.driver_data = &quirk_g_series,
>>> -	},
>>> -	{
>>> -		.callback = dmi_matched,
>>> -		.ident = "Dell Inc. Inspiron 5675",
>>> -		.matches = {
>>> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
>>> -		},
>>> -		.driver_data = &quirk_inspiron5675,
>>> +		.driver_data = &g_series_features,
>>>    	},
>>> -	{}
>>>    };
>>>
>>> +struct awcc_features *awcc;
>>> +
>>>    struct color_platform {
>>>    	u8 blue;
>>>    	u8 green;
>>> @@ -1009,7 +982,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>>>
>>>    	priv = container_of(pprof, struct awcc_priv, pp_handler);
>>>
>>> -	if (quirks->gmode) {
>>> +	if (awcc->gmode) {
>>>    		u32 gmode_status;
>>>    		int ret;
>>>
>>> @@ -1077,7 +1050,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
>>>    	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
>>>    		return -ENODEV;
>>>
>>> -	if (quirks->gmode) {
>>> +	if (awcc->gmode) {
>>>    		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
>>>    			WMAX_THERMAL_MODE_GMODE;
>>>
>>> @@ -1328,7 +1301,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
>>>    	};
>>>    	int ret = 0;
>>>
>>> -	if (quirks->thermal)
>>> +	if (awcc)
>>>    		ret = alienware_awcc_setup(wdev);
>>>    	else
>>>    		ret = alienware_alienfx_setup(&pdata);
>>> @@ -1338,7 +1311,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
>>>
>>>    static void wmax_wmi_remove(struct wmi_device *wdev)
>>>    {
>>> -	if (quirks->thermal)
>>> +	if (awcc)
>>>    		alienware_awcc_exit(wdev);
>>>    	else
>>>    		alienware_alienfx_exit(wdev);
>>> @@ -1362,6 +1335,18 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
>>>
>>>    static int __init alienware_wmax_wmi_init(void)
>>>    {
>>> +	const struct dmi_system_id *id;
>>> +
>>> +	id = dmi_first_match(awcc_dmi_table);
>>> +	if (id)
>>> +		awcc = id->driver_data;
>>> +
>>> +	if (force_platform_profile)
>>> +		awcc = &x_series_features;
>>> +
>>> +	if (force_gmode)
>>> +		awcc = &g_series_features;
>>> +
>>>    	return wmi_driver_register(&alienware_wmax_wmi_driver);
>>>    }
>>>
>>> @@ -1378,16 +1363,6 @@ static int __init alienware_wmi_init(void)
>>>    	if (quirks == NULL)
>>>    		quirks = &quirk_unknown;
>>>
>>> -	if (force_platform_profile)
>>> -		quirks->thermal = true;
>>> -
>>> -	if (force_gmode) {
>>> -		if (quirks->thermal)
>>> -			quirks->gmode = true;
>>> -		else
>>> -			pr_warn("force_gmode requires platform profile support\n");
>>> -	}
>>> -
>>>    	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
>>>    		interface = WMAX;
>>>    		ret = alienware_wmax_wmi_init();
