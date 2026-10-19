Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447927;
	b=wAWba6Y+XohBDHgd8tfQ6SSFKO6nL37UziAqRDoiLhibk6AUz+VBbTWqtQRE4HIRM0qA
	 uf5+eST3aHjo8ri4Ms4GEs2n9LRMPu7coV+rkoRFzen7D6HqJMd32tk24xvrRU7FqiP8L
	 EA4O7fhKCSyc35dhA9jIx442bVeg/EZHeWOq+FCYxkAdpWCaaZLfEQc8TDAn8d8S9/e0G
	 dXrrLl9Uz1GZsCj64ek4xCDxxzZ+b4GRmhOP4lOspkMBuQBcPohmyQu8kTC6zFuC/V1t5
	 GEgivmxFRHwDMGvxF0SkRGHf0o8RF26qerQC+isTkbNk2G3Dh8mNmK81mVzx9yhXE9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447927;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qOgEM347UA2oUXrlePKVhdOzVwXTFnw/rujmP6OQ7Og=;
	b=GK7a86V6j/vulLb4/ocNoYIgb3veGMttoAb8LwOuO81mMh5PnMFWpBBf5PuLU2AHI5Sx
	 q5qssGprxJrGf+Cc6Hdhi8ARV8lQRAPvp9+jP79cAz68KcjkgxE+5pmYRFyVzZVvrfaty
	 XsgDsx53hgx3GgKNRxsSWpudo46/KiHYGcKtFxcbPSSIFejvS9W1oFNLi64xiQccBPWWj
	 BmmQshqLK4iLtIpgTT/FeXDQ5ZR+Hf3Uaj3l0iR+b7AhMX5LrwRUGiw7B5mfR/nNR3Qmv
	 QZHZfVnQ3pIPoc3URHv3QLs0foEwrohTmaTmMBKE8hWkF7dYjAaEw3DDIHLiXHyFHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FhAzmzFg;
	arc=none smtp.remote-ip=95.215.58.195
Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F51606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 22:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FhAzmzFg
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DikdP9xMiFcD79eHzl2Rx85QAWRmN2Gb3vUT8s7Ubxs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792447924; v=1; x=1793052724;
 b=FhAzmzFgLT58AZzAGSVbJ21vLRvLIp41QnyctBylJnPV/rp43SqizB+agP1IhsoNxpAvxzhC
 VYtC8/wPdXg6BaHu5EexnR5xGd5k98M8glcnW69JdR+BxVQMQi0azR/dQyVPVLt749iRxr59eDa
 XY9uITxiN8GfAsHDeEmg+BS4=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c70924cc703aeac;
	Mon, 19 Oct 2026 22:12:04 +0000
X-Mizu-Trace-ID: 1c70924cc703aeac
X-Migadu-Flow: FLOW_OUT
Message-ID: <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
Date: Tue, 20 Oct 2026 00:12:03 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events on
 GU605MY
To: Evgeny Volferts <eugene.wolferz@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015163029.107250-1-eugene.wolferz@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261015163029.107250-1-eugene.wolferz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/15/26 18:30, Evgeny Volferts wrote:
> The ASUS ROG Zephyrus G16 GU605MY periodically emits an
> unrecognized WMI event (0xe5), approximately every 12 seconds.
>
> The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
> input device. When the session is locked, it causes both the
> internal display and an external monitor connected through a
> Thunderbolt dock to wake up repeatedly.
>
> Add a DMI-specific quirk to suppress this event on the GU605MY
> without affecting other ASUS notebook models.
>
> Ignoring the event was first verified on a 7.2.7-based OGC kernel.
> The DMI-specific quirk was subsequently built against 7.2.8-ogc5
> and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
> the DMI match was confirmed and the unknown 0xe5 event messages
> disappeared.

Hi Evgeny,

Thank you for your work!

I am thinking that a quirk with e5 in the name is a bit overly specific...

That code has never been handled and is just the EC repeating some settings.

I am thinking that perhaps the best thing to do is just create a case 0xE5 that
simply does the ignore with no quirks check and a nice comment outlining
why it is done.

I don't see asus repurposing that for something else honestly so it should
be future-proof enough and will potentially avoid this to other models as
well.

On the other end it would be cool to know what that really is telling us...

If you don't come up with an answer I would defer to Ilpo whether preferring
reducing quirks or keeping the symmetry within that key_filter function.

I am fine either way.

Best regards,
Denis Benato

> Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index aeb461b1644d..8d69231d25a0 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
>  	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
>  };
>  
> +static struct quirk_entry quirk_asus_gu605my = {
> +	.ignore_e5_wmi_event = true,
> +};
> +
>  static struct quirk_entry quirk_asus_z13 = {
>  	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
>  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
> @@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_z13,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS ROG Zephyrus G16 GU605MY",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU605MY_GU605MY"),
> +		},
> +		.driver_data = &quirk_asus_gu605my,
> +	},
>  	{},
>  };
>  
> @@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
>  		if (quirks->key_wlan_event)
>  			*code = quirks->key_wlan_event;
>  		break;
> +	case 0xE5:
> +		if (quirks->ignore_e5_wmi_event)
> +			*code = ASUS_WMI_KEY_IGNORE;
> +		break;
>  	}
>  }
>  
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5cd4392b964e..e7772397cd10 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -41,6 +41,7 @@ struct quirk_entry {
>  	bool wmi_force_als_set;
>  	bool wmi_ignore_fan;
>  	bool filter_i8042_e1_extended_codes;
> +	bool ignore_e5_wmi_event;
>  	int key_wlan_event;
>  	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
>  	int wapf;
