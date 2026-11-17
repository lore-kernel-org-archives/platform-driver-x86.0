Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952353;
	b=HirZwcZhRKF0RDu++Jz7iiG7EpGJ2X8wLfalh78HKMtXbAM+e5YH501Sytc6/G5XEfa/
	 OeM8xYC5xzgiSLneQUVZtFyVwVY7o8F0M5wTVcn5EG9+2A/B0Qu93WpQi76BZe/IrocIb
	 WAf7XCUZW2PKTxybp0dtID7sd1bkatqwoYmUAhKGn/PslXwtzmtDYjLlUuQghqRq79Zel
	 BGKyRCs2G/oBFYtRh4e/ZGJQKbezZaMq6kbMNmrryDlVrw5WgO6/cX3gijenj+m4XLyRp
	 M7/ok9j3xuQC9payaj8JUeMD29z2dUlwJuAvqDzShCwoZihII+dRXbyY0xt2CunUP4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952353;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=Eceg391Xk42ZnSt+YoVuGPfxfK5df/jR8tiW7SvsTVU=;
	b=dQy14nxt5HbfWSXvH2qjk5Y/dIAIxWZYmxdKW3K0J0NYzn/oJf9zocDFgoIJC0eiQInT
	 1D0qWEMUMClvSaZUUE7BEUvo4KMy8iIkcPSW0ZB+ZFROUBK9m+LmFdaocM9rRQzlzSjfY
	 x9OUY42Yao/4xNWopRcJ5/SovJRQlmP3SKCLcpwurSg7PLrsgfSW6h5nRGlZkiUmlclrN
	 1aEj/ztFRYKRqrp4UKrzl1xG80Tk/2xvTPPWiPJuD94AdLZ7Gsjqvkn3qymWzYJpIwNDN
	 Q8c3YFfjeodH47wSSCxrgpNAc3E1pTXuhpmll3vAmBeqdRnzvjHyhNVXPzbtvLBIwxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=aJ83hRE+;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91101606A338
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91101606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=aJ83hRE+
DKIM2-Signature:  i=1; m=1; t=1794952350;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:ZWl0V7C9t10sJHqNt0/EfyhBSoEx
   qP28y7qy867maqja1K1pynsNgG6q/1yyjLFZKzupyLtFzpcJPy48pxqQ106865IEaOGWmsfyQgy
   94eYvYn1THIqyD2ya1oYmWwW/3XFeFWIkpiTnN5TdYniAgrP0Ujz1WVh6I7228sG4qqLWPbjx5e
   WyyEhfhYhBJzVIQZScVA1kmXZAOLQESXd2HoymGnqYCVLdpYcnv1tA1JhpMGgzw/nOnNX0uUV17
   lw7RQhooKQJN75Jn7lPwA+t5aljP0RZAfnwBj4ZB53bqYN921HLphueuRvzaYQecaHZlUhemh3N
   jaFtXkRS4hwmwA==;
Message-Instance:  m=1;
 h=sha256:
   f5p5Q7HmsLP93/PzIGPvPboP/nWlBHW5FdbHJD4ihPI=:
   jun/dwhHutmLhG3YndF0nQhsQbU208pAz8oPxVyc1xM=,
  sha512:
   EDLJJwn83xxKBAhXSKkaoQQfvgC3VpvQ9gBuvhhqjoDpVB93k0C3vqkvovd2XOVd6pRjTOmW7q8sTl1aoJrPow==:
   4YVZ39JjSBN9B5W2Av1l46H6H6zo9IrUMk3inddlzkjVDCH5QzZ3iwZFB7A3c9AilTdyfk3GSf8t759F/aKH8A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794952343; x=1795557143; i=w_armin@gmx.de;
	bh=Eceg391Xk42ZnSt+YoVuGPfxfK5df/jR8tiW7SvsTVU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aJ83hRE+tWPXkgdvwEEEiO2HoAh3SfOF4C8c9F/YhobK+1mY9sGu6HdqGuNEkU4H
	 Lq4ajO9cehoxHysUOMa27cWDWz55mj8yaH5e4MXNrYPdmcASscZSFFc861jcjfzZA
	 tIjEmO3pFocNS/orLd39/paYYGk9WEbGF+Ch7qLM8nozahO3Vs/uP+UmSc5nFgLEX
	 3ev78kQNNI7N9GAzMbrcYu/Alx0pp0naoSOovgPuGKfYmWw/ht9D4myRrTa8WM3Jo
	 ePtdsi/khXUBwbbZ3noxNBA8ZnO0tsK/fW3f4DXuSLN67TVMArtZCC+WhIJRWJZ9A
	 iK7Ze/dkNr4j9UPCqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1x6HXX0WaS-00StNT; Tue, 17
 Nov 2026 22:52:23 +0100
Message-ID: <573e079b-09a0-423a-92f7-6213672feb59@gmx.de>
Date: Tue, 17 Nov 2026 22:52:22 +0100
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
Subject: Re: [PATCH 2/2] platform/x86: dell-wmi-aio: Ignore HDMI Input event
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 teolyub@gmail.com
References: <20261117214604.397131-1-W_Armin@gmx.de>
 <20261117214604.397131-2-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20261117214604.397131-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I0AI9RmzhzPr6fBXd3ThWJEZz7s/oVf0lE8ncGpNstX/4AvGOtx
 1ZGEN4ARj2YiCD9YV2O8JFax334/GFk3eZm5c3vibx2rcR8d75GoISmZGGtVl2POIphS8pO
 5ZLMhOMsUxi4hT+VKBfP27r5xAepu2b+e8FVznYvnQydUTGrPcFH90X3AYQI3MYZpV56VHO
 oGE8BCb3gSPHqJCgGIq8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GeYwQwYcgNo=;xJfxFqXyqqJD0SqJBpqqM6dzXZt
 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

Am 17.11.26 um 22:45 schrieb Armin Wolf:
> Event 0xDDF2 is used to signal that the HDMI input was enabled.
> Ignore this event since the feature seems to work fine without
> any userspace interaction required.

I forgot to ask Teodora if this patch is appropriate, so please wait=20
till Teodora as given her OK on this patch.

Thanks,
Armin Wolf

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/dell/dell-wmi-aio.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform=
/x86/dell/dell-wmi-aio.c
> index cea50ccac7ea..277fccb0acca 100644
> --- a/drivers/platform/x86/dell/dell-wmi-aio.c
> +++ b/drivers/platform/x86/dell/dell-wmi-aio.c
> @@ -53,6 +53,7 @@ static const struct key_entry dell_wmi_aio_keymap[] =
=3D {
>   	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
>   	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
>   	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
> +	{ KE_IGNORE, 0xddf2, { KEY_UNKNOWN } }, /* HDMI Input enabled */
>   	{ KE_END, 0 }
>   };
>  =20

