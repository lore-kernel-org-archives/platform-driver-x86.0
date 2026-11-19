Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077738;
	b=RWlD/RhgWdzjv7VH1T7QSztKpsqQD9upNIsRKgf4/hz91UDyxAHMlUwpnooP0umXR3fi
	 hcwP+4OKAZl/cY8/wLWrU0nMSptbcZKPqDUh2TtjDBcErRzWas8Z8/6UG4A5Y9u8AEiOX
	 LlBVc4AgkUTqd2JfwVHAZGD6oxzhDjs8HoEkK0YcJGzWuV9AFMxIrp+mNs5LogWClPHSu
	 5Mw7/ngVaJRHqjbtx00kdelPb9vTyh8HxB7DjkTVgHTur7rbdGzzSb3LgIDOT7gIZf0p9
	 HBg0wDLohIEwZm3chf7AZ4eCGRDi6yW+HvhFVHF9JS0UPY+6ISZRnkH9m7ABf6T9cgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077738;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1XJavdPEzPCN0EQYi/Zq+Ti1eZf4zPgm0LQ123f3vYg=;
	b=0DHSRF9s+5DX66UjImrjlnl2IR1lbzvC5F7hiuwksbDWmUo+XuFqS7d2AFx2fooRMS84
	 LCLMxSHRjSft7YcBNcPUgWTPjHr2f/ojB6MN2J7NpdxtKIwrxjYscyCniv7Y2k1b1vL7R
	 y0mQTRy/bwKf/zLr+7Q1vC05GFN+PKyLwgjl2ItHxf8HbSeqLXQ3ceOSFXTE7JvhyEqhF
	 0od90mpr546qVO39E1+IYZYXBTPK9VHgeMAC8TJTmMM5JRD6efdD/PGI/ASxVwym1RagU
	 0C1Y1g4d7PrdWzRbSrjvHSWFBkUpbZyoRcxHY0+1a7jDugQghC4GkSDMqNX8X4spGdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vdwaa.nl;
	spf=pass smtp.mailfrom=vdwaa.nl;
	dkim=pass header.d=vdwaa.nl header.i=@vdwaa.nl header.a=rsa-sha256 header.s=fm1 header.b="LgTZ/xjC";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=syZKrsZ0;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ADF606A326
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23ADF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vdwaa.nl header.i=@vdwaa.nl header.a=rsa-sha256 header.s=fm1 header.b=LgTZ/xjC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=syZKrsZ0
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3D99E1D0028A
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 03:42:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 19 Nov 2026 03:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdwaa.nl; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795077735;
	 x=1795164135; bh=1XJavdPEzPCN0EQYi/Zq+Ti1eZf4zPgm0LQ123f3vYg=; b=
	LgTZ/xjCa+RLREZRDU+2vrk3cclrWlBUkVOm41cqIjTZ4VygLyUrvm49+tmn4+X+
	YNT1MlJcAj4l80ZQ+VzGV+pdsDYa3gNCitiLFwZaxYWEhwl98PWHAl63kRK8DFMB
	nQ4jxLgeMIjUKRyetpcXbp0UezQG9wHIbfo2fADCvj61cELmSjO06HSA0HNd4dIE
	CjQHJu2+NKzPFQetjyOOqIPwP34e2BLQNIn0/8eeZr0H29RY7jyOdJh+gbIPMCMK
	3azQsLhQ/wFG2wDAPtLod1J12XSUa0w7zIzWdVzxGGEIQgUX65EYTpV4td32qAmM
	cJoGsqR7Lz8kDQ/AW2a3Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795077735; x=
	1795164135; bh=1XJavdPEzPCN0EQYi/Zq+Ti1eZf4zPgm0LQ123f3vYg=; b=s
	yZKrsZ0d6/HTXeRKKwL7FRROcDAKXnf3NA2UFAHIgPCpvVdun9t/U2gZvR0X9klm
	lEVpry9WgNna5pcVzgiwe2RlTHIrtkv4fyz5b4XKB7viWoXtlqzG+sbnLY+9GHFP
	ZQiNGqaJE9Z1wYbf35rkrbOmibDq4FL/bv+kGdgiNGyx0EjE6O4M+Vi2QoNV6f7j
	NyXXICUREtM6arNsP3uEvB3cdsAphjONDNLP8sXIefbLOg3lPVA5+1AmYeku9bPS
	LeNVInkOxPQYHKkGEeMWNo6L2Sr93G3FygIQ80hYnwlfl1Q3n/b9isy6S1y4w/Lq
	VMLXBwt5Uh/++gRcx5L8g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=vdwaa.nl a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795077735; d=vdwaa.nl;
	mf=PGplbGxlQHZkd2FhLm5sPg==;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:MCzOJuUGHz8SQ1gfQhgHdqVq8AUvAaVMKlT32Bnym/y5waZ
	FmpUe/MSD8bYarc/WDGvjbAFmvDYopCwVCMcvCXhk8urYI082ArMarz0CBUCskO6
	bGAvHOkbbrLWJaUBAjJbZL0bzy74gfZIz7Xdzgny7X2s7WtlNYoM4wL308ju9KhD
	xZHqH90RPVAKj1kkZYJwUXI8yb+efnkF5CXwhDPObyinaGIyDh/Mhny4YsJpx8tJ
	1pXiG4rkj6PKk8mxikZ8CrUzGnKfv6a/v9HjWRocQJ3W7EF7Nks1eS5WnXtG6bg/
	MGWVIQzWqfw6mo2llabo/EKwaLAGgcEAk6FH4bg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=15;
	hn=autocrypt,cc,content-language,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:AoEIlr4BfBBl0+QzWLEeonTqNHBvSZkJ5mS+9zhjPVc=:1A3Y9cVz5VDyGc4psE6hQuMCwrVwTzkrdxmE8ZrD0oY=;
X-ME-Sender: <xms:Zbb-aoa8tMFJu4sfMHg_nJ4IIA8Nw1iwqV5Ni3KK9YPorY0D0S9aeQ>
    <xme:Zbb-auXHDGpGeWRBd_7OwJs4mrKi5GHL28dAKxhaKhFxU4c18WhOxrsrg9dfLscTy
    MiXUd9Z6ciGltX86PHnimzXWAU2NolzJBZPvC9PH_O3Xokheso-FhFAxQ>
X-ME-Received: <xmr:Zbb-ah9RLY6oV8BW3miQGDoRvqBsd4wlOLAXEB4OQHnPEG43MY2HrsBdMnUykbXP1itqJgOSXz-hWVNcFWT3HWgRMdSZWg>
X-ME-Proxy-Cause: dmFkZTG0D1KYly65ASh4Pth/K5DpuLXXMar1p2iWZvGpKVRCfslbSly9oLnaUGGLl1DQFc
    xp1F+mVgddRVBLE2YBv/JuHugNJ0N/06GKG9hXFovLyMujVxQArKPFi036v9XIGFNP56IG
    RKfpcnpdYJOLqYYMz3gh91oa7g1ZG1AUp69sCM2rWZ9g2J5MXXIqtWHL6Qc23YTgNSrBg8
    GLE0/f1OWEUYCmCutoyNTgw3ptZyR3BXITxJ88U9K+4vI2FUjnC2G+yHk3aJfiN7/LDv1T
    akECfqgCGxvzF9NvXdCqEUnG+Ht34sGJKIt/ApN75blE8aZfcDEo2syFKG43d8o41SqFBh
    Z28gEc4z3u+s5/zjkjDjNilTWi+5/pYe4Q2/hfM6zVFtodG0DMZ7p5UW3GRe5BhAxrVBpI
    QyL62VKXJuwigTlfVkmRkszBrivPJIWX+6YVal3oAdOqiHKf5lSWpY0lx91cy3PRCyC12m
    Ug50roGxkOjQ74z2PGQ850yGrJoi3TFzCYqOsZm/CKDzRTjzqj1Pw+0WGAeXC2Tzg/izmE
    iUnzeT1ozJ7T2YdBH7LkKUcl+V8zvxN5SSfIq1Wxab3hW8OZAbqWF1rCqVJ2stMrg7CLRu
    0xygdVtCwWUWsG62wQn1Hc8xI7gVn3KND4RLaMnj7DRtz3NH/EFhs7WsyVJg
X-ME-Proxy: <xmx:Zbb-an9oj-kw0uMotz57fZ5C1oE8_e3CQejYU5g6M01vr44QFJcO2w>
    <xmx:Zbb-ahR0Saw11NUGLapLsmxotyMkgahARhabelRr6fuR32PjgMja8A>
    <xmx:Zbb-arfSr0JIhzTVkw-jXMq6vQzGj0uaqgcTxA6PLuJTZ_GLzxX4NQ>
    <xmx:Zbb-alD2lZZAcJ6-1idamhJk1UIxliCQRnSSGufLRdNOhlfVbBN7Cg>
    <xmx:Z7b-ampyiVtcIwx1AXQhd8Yjl3u5UMhwvv9_EAtrZi2hWOGl0ISMWmgs>
Feedback-ID: i2d0446dd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 03:42:12 -0500 (EST)
Message-ID: <5aca5abc-329a-48ca-a8d5-eb05678a6f43@vdwaa.nl>
Date: Thu, 19 Nov 2026 09:42:12 +0100
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
Subject: =?UTF-8?Q?Re=3A_=5Bacer-wmi-battery=5D_ANV15-51_BIOS_V1=2E25_?=
 =?UTF-8?Q?=E2=80=93_DMI_matching_and_health-mode_compatibility?=
To: DIPESH SAUD <080bct026.dipesh@pcampus.edu.np>
Cc: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, frederik@harwath.name, moh53n@moh53n.net
References: <CAJP_a1ZH305H52ciUinxacQtVe1xC=DLS2H7ErF5g7AHt+Q8rQ@mail.gmail.com>
Content-Language: en-US
From: Jelle van der Waa <jelle@vdwaa.nl>
Autocrypt: addr=jelle@vdwaa.nl; keydata=
 xsBNBE6QLAIBCAC3O6LmF+GKvOh7IV00TG+EKAQHAwjESnHGJOW58lKK7eAYn62ZM1uy0+6h
 yCMu5PD7+ND6U1gcgTTHYwNK8AaJt7yY4FRssgdcJk59uJBwROZtllotClJ893CuB6Wgr68b
 07gIRbENYrB8rEoGfpUG//8/ep7sY8PS03jnFb4ll6mPlUE2oQVdYOlXgF4f9qkkIi4SQeE2
 MTuERaOrDuUNDlroJ7Yfx3J/rL5Qjn578/TKCAxg0pns6VIA/P9spRGmLhT4zP+OxZXeSZme
 IxcwFdJJXHr4oGaZvqe1yHlMmKR98rrIfPWhkw2Ls/XIZIxf6prT0XyczbzBnC2y1JyNABEB
 AAHNIkplbGxlIHZhbiBkZXIgV2FhIDxqZWxsZUB2ZHdhYS5ubD7CwHsEEwECACUCGwMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheABQJUX8WhAhkBAAoJEMBghjN8UHc+mFwH/jjN+Qob4O36
 YiieajRwVLGuYdUDt9Z655oQYU8V4qbWf2tjUtqTYXrxLnaY6xQoYouRz9yFbh9dIKZb67ir
 7AeVgCOtWVesGxAlGH6EY5JBZcsN0v0ScsivqQAv/Mv+4HK+XM57YlyRagD8tkprYskioWHg
 OwQfXAO6nlm4BJHWO9bHJUMgiGs7I190IKQG7iLBnJuGjsOFuy5KTLpnv+w7twmz0H+pkUPe
 jVHfJlJWdN4v1PigpgpjOR6ZepSIggMk7dHsa6GNLUOzi61yYVFe60+EGXhwyJIqSt56a4oR
 jMUcXaOugGr+JwC8Eq7Pg2+aFk+8fbe0oUzZJucHGnDOwE0ETpAsAgEIAK4Usb7B00WRxCZG
 HtM973F7V4OhOKv4kZKduxtu71bVUZsTuzn4h+m8guJ51uY/I2icUrN9gJG5aEzRqPuQi2L7
 KmZUjs3pscZWgUgiT8UZFDR6RuQ4k3CcWobsRCjYZdSblSZ8ccrLJE7xSbwKMXjAh2PEiaQT
 lS6wQbn6mHv4y3H9QVHs7+jXbmfHCxnVcwLqRmpuegSmezDaL5TlSc102voiXinhrWEZUvAB
 KDh6VuJ/60Y6zelCXVsEjRaApz90iXY1nifLhkHM8B2wG7Pum3V3X0Y0QTVD+z3EL1iq5mFu
 epKp//IOeeJN5iwHcRSJGy2s1oOzjRDyPv6v1AUAEQEAAcLAXwQYAQIACQUCTpAsAgIbDAAK
 CRDAYIYzfFB3PvDuB/0dI13hSYHW27c2Rq8BaGbIhXYYETtPD5B25/P1JJ5OQZkPmVq+vSHw
 uzUaDZHy3ZcwE+xFXzlkwXGdWos07JUGo74zV3HfeZxVEPv0HB9ACqQVU/JKjLZNj2SfhgzL
 4F+O4Zgdsf0YaZG09F5PbMvbhoCZLfAaKWz/4fLEfhrDJLhrphUyPDXosn0UxPkDv0iiixn4
 V+bEZ5/wd8dRWi58R/iND+gRGsBREm5SpzdhnsarwoX6YdsQ449379enDNUN7jV4C3Gkon2s
 VwI2ZZbS10cY8rFSAV/CJA2E9daRoz40DI0tgXgLBAVhy7y5HWZJsDZexU0HFKJfkDi7RUPj
In-Reply-To: <CAJP_a1ZH305H52ciUinxacQtVe1xC=DLS2H7ErF5g7AHt+Q8rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/19/26 02:52, DIPESH SAUD wrote:
> Hello Jelle, Armin, Ilpo and platform-driver-x86 developers,
> 
<snip>
> 
>     The upstream driver’s DMI health-mode table contains the product entry:
> 
>     DMI_MATCH(DMI_PRODUCT_NAME, “Nitro ANV15-51”)
> 
>     However, my system reports:
> 
>     NITRO ANV15-51

What exactly reports this? Is that from DMI?

cat /sys/class/dmi/id/sys_vendor
cat /sys/class/dmi/id/product_name

>     This appears to be a potential case-sensitive DMI matching issue.
> 
> Questions
> 
>  1. Is the Acer Nitro ANV15-51 known to support the battery health/long-
>     life mode implemented by this driver?

Not by me, I have relied on the out of tree driver GitHub issues were 
users have verified it works on their hardware. [1]
The driver only adds user tested laptops to the DMI allowlist.

>  2. Has this functionality been verified on BIOS V1.25?

Can't answer this for you.

>  3. Would adding a DMI match for NITRO ANV15-51 be appropriate, provided
>     firmware compatibility is confirmed?

It would be appropriate after you have tested that it functions 
properly, this can be done with "modprobe acer-wmi-battery force=1" so 
the DMI allowlist check is overridden.

>  4. Is there a safe, read-only method to query whether this firmware
>     advertises health-mode support before enabling the feature?

The driver does not automatically set a charge limit but tries to read 
from WMI, alternative you could dump ACPI and see if the methods are 
available but that does not imply they actually work.

>  5. Does the driver’s HEALTH_MODE correspond to Acer’s commonly
>     advertised 80% charging limit on this model, or is the actual
>     charging limit firmware-dependent?

In my testing on my Acer laptop it sticks to 80% charging limit.

>  6. Is there any additional information or testing you would recommend
>     before considering this laptop supported?
> 
> I have not loaded a custom driver, used the force module parameter, or 
> invoked the firmware write method. Secure Boot is enabled, and I would 
> prefer to keep it enabled.

If you don't want to load the driver then I am afraid we can't help further.

> I am particularly interested in establishing whether the firmware 
> supports this feature before attempting any driver installation or 
> configuration.



[1] https://github.com/frederik-h/acer-wmi-battery/issues/92
