Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3D7184F;
	Fri, 27 Dec 2024 00:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735259812; cv=none; b=odoVl4t5sluvcM5Bc9M5fPi529JMWjCN4A9K8MxiHekquYt2SWkTDRTYaumPloiD09JEdC4KWDYuKgCPvvdKreTfaKa3aiQMTwZgP8pb8vaK/O4BsSA6XKGX8mRLtm6tWcKyrH7Awwk1E4nCgZ+ol9AdY+/ojk5g1J++TwY5X4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735259812; c=relaxed/simple;
	bh=vgjoqzFLBd9pf38qIKoZPEK4r3m9hb2mc3NE6wni1mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkEioNNIYi/I2HrA7YComMIfeSVyGBkJJ020k7QSU93IarpHuEpC39Viic6iCLnhbuywRggBtW8RqMv++QxXKIzdVFXnwsx5tydneZdCRP2EffXceX2PysfwdW3qTemvcr6nu46H5iHUHaClykQVQlVGF+4dv+QL8d9s9AbDb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DjLKjth8; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DjLKjth8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735259803; x=1735864603; i=w_armin@gmx.de;
	bh=F9bjA/Vsezf+BBLYRQHJwh3ovH8kOpAVgRaJmVAdPqg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DjLKjth8JoqmtlK0AuuDtpqxBYSX66m4xZmRjhOtgQ+kv3HKJSF/zVUPKt9eSp5i
	 ah7Rr1OolycM6Qv7va8OJ3oFIRNMXHtjpE26CnS3X1XO55FJC5FQt83uDBqNuLM5u
	 22C36ZkLjOodvc3h6A3eg7Bo4iWp3jqJHWcSU2la6EWgEhEOFAToKo3D0jxAHWQ+q
	 bm3h/38IHP8+xV8Ux85x11teHcbIX+nBqdMLtvJbQthpqP7/LpUSoe+87MRCDLJz7
	 5WLfKgincZiBQQ7ZvI6f3OyToMZsISE5keOhWfCs51Fc8fwH86LlIOURLSjdH3x/I
	 a5CsjyAUt5dSDRqdIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1ti5gg0JQf-00sA0N; Fri, 27
 Dec 2024 01:36:43 +0100
Message-ID: <95738a44-6fff-402f-943a-719d582801ba@gmx.de>
Date: Fri, 27 Dec 2024 01:36:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] alienware-wmi: Modify parse_rgb() signature
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-4-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-4-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iDVKLjNVeuoA/4TlUwUYntMx0fWswaT36/XCb01vV5r+2fpfCdS
 +drx5puXqdOjOOAJmCp3KF9JbKbkOD7n5GHEdptZfxHBmWL4VeWSJSYg1kysnQQJE+y07cb
 XNYjjfqJb4/lBPfIgc4dX6zFCxWH4rcptM9QSymGuN0CMRXbq2yZDRwR3oI8t63UsApFYXn
 bGjAOkE9HueVLhIRG09WA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+8ypwYlwkeA=;xHT22l7NlGNwsHZBsjBciM/hg0s
 snId5RSsITuMhBjrz8fkxvBMK0OttHLzkVLASFbIvCPxpaMWwLQQizREw7JTdTgjKMdKEwIjC
 lhQ9zQNq/xP5uEPtDSB3zaXz91uiOOlB3YrBTrZAsPMXXJsk5SI80UzIui4P5D1/xEw2E8muS
 tQ6i6Ds3pm60R+CgXGXY4nyKJCS8w2WFlEF+NLZhVMZTjoCSqmcwxR35UWgerXUl1uhcodA+T
 3cc1DtZhwUZbQYkurRr1uLFv/IwXvvqWwqRlCSqAlT7AFVFCRcHpMy/nZqgwciRrMrw5b/+pO
 g6zwERngGEW17qcI8pwPxVR/XfO1VfqKFaEtzBq01FCsHsU1jJ9di0TXe7Ti9JWHUOV0PDVna
 4pm+Gq0PVwTDNK2GAdD9TI8MM9fhl9YvVTiEYZiNwM3kvJ0QXa2M3zw7HGGgtFZ/LUlow9n5x
 zjl4ZLlFA9ahtlMPu3DdtTlYXfofA/cIQ1tUjJUTMp8/5VEznNhvRKLEl5d04CV1GdWrzIu6H
 SgBu6MHAlbHaUZ4/Em8naKSXaNmweGybmAxWlZ4KQA59NoF6bERXVc2NitljlIfb1oaWToDmB
 vSBEDSyV7B5sfuAWH5xt78dEJsd/newUxOOaDQqYvm4Uw87UMf1vzlAhf7NLV6ch9z1XTfGzE
 bGESQUDvOY/wESqOHV4c5vPO/XJ022TQPV2L/5/3pD3mMsL9lNGyS9RooDp2WxIri2XmxSS17
 9tntO4UvZcbYpxC+XNca75L08YoDq4bwFKG7lyKSgPCCFm5Mhgx1LV3rUgHwAXjIqeTMh9CMl
 HhlT7hE75ftF9bYkkiTuFoJfzS1Dac+1kzDkRj6jrT+/tZRLlt4fliR+tdcTyGKZYTWp97arH
 U5eB7e/IWjhc9/aMhBWBeLE7Z2xj8GadFJxez+bXBxJIf78ibnBWqt0R6MymLUtXtcPr7CwYh
 E0NJk8U2+OB1s/Y7WaIImA5wMRepy6Zn1QavejgJzdQ9gB1tlM2LnA4IoXPGipbHEk3IBlNFF
 dQAnzwMNU0CUlNAC8CM9MsyQmqFjzR6XxuQ1zZAGHR45vkq9l12sY4YQ1ZfAgx6ASzz7HWJvY
 4/6O6wdPfuL+iwuaH3DzJ5XSJyu/hz

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> parse_rgb() now takes struct color_platform instead of struct
> platform_zone to support upcoming refactor.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index c5ad0f95c442..273ce9b10765 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -434,7 +434,7 @@ static u8 global_brightness;
>   /*
>    * Helpers used for zone control
>    */
> -static int parse_rgb(const char *buf, struct platform_zone *zone)
> +static int parse_rgb(const char *buf, struct color_platform *colors)
>   {
>   	long unsigned int rgb;
>   	int ret;
> @@ -454,7 +454,7 @@ static int parse_rgb(const char *buf, struct platfor=
m_zone *zone)
>   	repackager.package =3D rgb & 0x0f0f0f0f;
>   	pr_debug("alienware-wmi: r: %d g:%d b: %d\n",
>   		 repackager.cp.red, repackager.cp.green, repackager.cp.blue);
> -	zone->colors =3D repackager.cp;
> +	*colors =3D repackager.cp;
>   	return 0;
>   }
>
> @@ -538,7 +538,7 @@ static ssize_t zone_set(struct device *dev, struct d=
evice_attribute *attr,
>   		pr_err("alienware-wmi: invalid target zone\n");
>   		return 1;
>   	}
> -	ret =3D parse_rgb(buf, target_zone);
> +	ret =3D parse_rgb(buf, &target_zone->colors);
>   	if (ret)
>   		return ret;
>   	ret =3D alienware_update_led(target_zone);
