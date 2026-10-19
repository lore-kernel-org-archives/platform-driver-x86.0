Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448513;
	b=Ya+u0AxGJ/z9PiADvibJDPKpLAcj+zAdGwn8Tn3hOlJ4RzD/J8Feq9phCKtC7brYBART
	 r1IsNYRHyR0NTqkEQpos4Rz9WZT4iwEGvF5niIW6RzMBdYonPGSv2NYhioxJts0EnbXNu
	 FIrnXJI3kwnwElVMu1eFy0GGLNrn4uDhjYXKFdNPaAiC6Etz9MU4dJcN/MSMoEsHCgqgn
	 KDVv4JanBXlAYQwrxDf5WJLECVhMHtjX6QPwxmKFcepsjqwAH8B5fcMxT5khSVPY1mufa
	 Oq0kVlrTy0+Muad8UxGUfULkznbLOYKdF98WJj1h6yIpoxf5i8Mm6FYRhHzb1pP3yTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448513;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9aRi3iCspytTEhL2bj2+X+AFhHbP25Qiq8VUp/onRRE=;
	b=L7pnVNXnmRrVKCaRf/twFMBEEb4OLQCBIJ9lYmXeEwXw5f73t4a1dR8dH5VEs9NGWTaE
	 uBD96p3uCQ7r7iVjBGSiF/ofSlZ6c8MdNGPSP6Db4C7TSW2VOEZVolW2k0hd7Ax/46hso
	 SMiSv8qd65x5Tv6Y/PkKl4wXLl9n6TqzMuDUAqvyCR44iXiwi9Gwx7rCgRFz31BFQhT5+
	 /HLtD9oxp6GHi5Pw/aTxgZPRMgIdUs6+p3OZi4rcZzOROD9Zx4xOaRX6fZC+cO8LKCpOq
	 IQr9Gfwwke5806gEd8fDxrotW2z24FfiTRz1jGdaqRAnApxNxAA+n3upem9r6/F59AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="XWTh0I/N";
	arc=none smtp.remote-ip=91.218.175.118
Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487B606A31B
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 22:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A487B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XWTh0I/N
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XV3omQgWoh7n+7S9LgtEn540AXG/v/uyfN4vOhm0FxE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792448510; v=1; x=1793053310;
 b=XWTh0I/NuU/cBVOkrdgkCc9HkAXO4wKizBbwz+6Whb37DWb/ZgaGNkgM3kwwNUwh0czBazoY
 dhw2P8rfp2k4qeV4vNj2nr8lIMVGbvcxnQPxlmYaxkpeug0qwfECTVRNwCogZfC8gigC6BNiJan
 gtdP2oRnLWWMZPylm51YAGlg=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a10694a14aa67984;
	Mon, 19 Oct 2026 22:21:50 +0000
X-Mizu-Trace-ID: a10694a14aa67984
X-Migadu-Flow: FLOW_OUT
Message-ID: <eb6e37b2-6816-4e7a-8d51-b0423af91ab7@linux.dev>
Date: Tue, 20 Oct 2026 00:21:49 +0200
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
Subject: Re: [PATCH 2/2] platform/x86: asus-laptop: Add WiMAX rfkill switch
 for Pegatron Lucid
To: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010193837.1120-1-kotekompotek@gmail.com>
 <20261010193837.1120-3-kotekompotek@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261010193837.1120-3-kotekompotek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/10/26 21:38, Pavel Kossenko (kotekompotek) wrote:
> On the Pegatron Lucid the ATK methods ENPR and DAPR enable and disable
> a radio selected by an id. The driver exposes ids 0-2 (WLAN, Bluetooth,
> WWAN) as the pega-wlan, pega-bt and pega-wwan rfkill switches, but the
> DSDT also implements id 6, which drives GPIO27 and the EC bit WMHD:
>
>   If ((Arg0 == 0x06)) { GP27 = Zero; WMHD = Zero; ALED (One) }
>
> The firmware leaves GPIO27 high at boot. On units fitted with an Intel
> Centrino Advanced-N + WiMAX 6250 combo card (8086:0087, subsystem
> 8086:1301) this keeps the whole card in hardware RF-kill, so Wi-Fi is
> unusable even though pega-wlan is unblocked:
>
>   iwlwifi 0000:02:00.0: reporting RF_KILL (radio disabled)
>
> The same card works under Windows, presumably because the vendor
> utility calls ENPR(6).
>
> Register a "pega-wimax" rfkill switch for id 6. The rfkill core applies
> the default unblocked state on registration, which calls ENPR(6) and
> releases the card:
>
>   iwlwifi 0000:02:00.0: RF_KILL bit toggled to enable radio.
>
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Pavel Kossenko (kotekompotek) <kotekompotek@gmail.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 8e69f02..ef4c2cc 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -192,6 +192,7 @@ MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
>  #define PEGA_WWAN	0x02
>  #define PEGA_ALS	0x04
>  #define PEGA_ALS_POWER	0x05
> +#define PEGA_WIMAX	0x06
>  
>  #define METHOD_PEGA_READ	"RDLN"
>  #define PEGA_READ_ALS_H	0x02
> @@ -1454,6 +1455,17 @@ static int pega_rfkill_init(struct asus_laptop *asus)
>  
>  	ret = pega_rfkill_setup(asus, &asus->wwan, "pega-wwan",
>  				PEGA_WWAN, RFKILL_TYPE_WWAN);
> +	if (ret)
> +		goto exit;
> +
> +	/*
> +	 * The firmware leaves this line asserted at boot. On units fitted
> +	 * with an Intel Centrino Advanced-N + WiMAX 6250 combo card it keeps
> +	 * the whole card in hardware RF-kill, Wi-Fi included. Registering
> +	 * the switch unblocks it by default, which calls ENPR(6).
> +	 */
> +	ret = pega_rfkill_setup(asus, &asus->wimax, "pega-wimax",
> +				PEGA_WIMAX, RFKILL_TYPE_WIMAX);
>  

Hi Pavel,

It's very good to see movement on such uncommon hardware!

I'm not sure what will happen to similar models that don't support that...

Perhaps guard it with a specific DMI match?

Best regards,
Denis Benato

>  exit:
>  	if (ret)
