Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452161;
	b=LhbMGryoF9mcZ1NtgX51LnwjGfdfxQnMyS6D1ibu7GUmwR0SXqj+0WLwkV5F6DvIsoi2
	 EPHsM7hKvDdcmZcgXb59skp3sSSEqtyuOz3Ow9V3pOybLF4aIo7JXOLFArE7betS8/YMK
	 ufqwQnEIy4buVhXbmyhl2PoMzsBZU3zJwJ+aTRfJyFlze8x6uwgOc+MsZwk3YRaj/oSM3
	 /oq3z+8X+T9rsd1pea8DyuOfuE8nvIDLPcvfqtucDQvl8sM5buMy4SnnmEakwDTsiR0gv
	 bLGsS1DyMGzWYCKiBo50BNavOvAW2KC/PSerozeUrIxG0r/1YUY/3MNhIgc3PQ5DFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452161;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=6QwVVwQ+6SAqGJmGNzzCqS028QJ83uJcxc/P+kk3Gkw=;
	b=lzOsAPMpp6MTKAN9sS90GLn0hCxEMPD4tSGj82sFtZ3hKnyLOvcLgvesc7ULZ9vdtA78
	 TBI2i89F50fbytzjxeiYs71mpUMqmkG2/ZXL2a6BygwYq7RcaqlcbSl6kEHPl7H+pkAm9
	 23P7hLPN66Z4uPZTlbIdZShyjPIHFIVpfIBLLSyOVdv3l5LTa3cZnrUJmoZGJ2yuAZcYg
	 rY/Z6qkY/SmpSQVUsaX0yTA9Iqs3EHhP60FPzqmZvPWIdzAC/IZ4ZjO6sP3+EuJVX2Alq
	 zBJfi4tT6MWhh+a2O2ef5epd/11mc5upAfS/rMAxpmEfsnkBwX4uz7D9dQj3Mp0zxpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=A4WxEGON;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="R4p2Mb/W";
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C990606A31F
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 16:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C990606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=A4WxEGON;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R4p2Mb/W
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54EC07A05EE
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:42:39 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 23 Nov 2026 11:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795452159;
	 x=1795538559; bh=6QwVVwQ+6SAqGJmGNzzCqS028QJ83uJcxc/P+kk3Gkw=; b=
	A4WxEGONc7TxDgLIVMunGIOMYv9gDjtkLj6lbmPuWaD6+aNvH93yuB1xNlQzDRTS
	EKi/uCXrEoNADL8GFJeJk6Hl3bk8qH8N7QqbsIHSD9lJ7N59dv+LBhEYzQC9pBr/
	fGCdyOFkE7arE0RFK1BDGt5WCToYpJ/rQIuJ+CGYyniI7sCgUSRIGqTmhp2wMdgZ
	L6hsu1SbtzTZK5Pn6W3lmpnruFGbilhCeZTMUrFYwyfZ36l6SB59v0abiNnu7As1
	oxyFpJUo4Ai7fo8Oa3CvqyqstGOkB857naeVQjW2EVoncNTM38yrb3pM2IriOLO1
	h+lUJSOPye/TIPfVYMKg/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795452159; x=
	1795538559; bh=6QwVVwQ+6SAqGJmGNzzCqS028QJ83uJcxc/P+kk3Gkw=; b=R
	4p2Mb/Wuohc0PFclpM3pI0mOK0sqGhhA3Q1Yq0ikhuQ11jHiSfQbfcJGhFAJ074h
	7C0/FBgM9l4EsCA/qP2PL+1KhtXk3qavgu1BqTFBoSKu64IJu5GiWWn8u18gm8nv
	whx2VF1yECatQeK4RjKLmhjHIYw+H7+DE5HxE2seSRK7kQMZBjrPPdha/40kR93I
	1j4pvBNQqbWHdoZ6tOzBn65cF4/LeFx5TXjso86vjuhXapsgN9B415g2CUEPlmqQ
	k0BIgf3/KwVAoScdn1wD1JXb8jxxxQMusYZzwkDPFnUncBtdTmnrxuOmug9RtoIz
	nfcu+MBFe8QEOG2Ec+GIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795452159; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:Ofo4u26ijslJHgqliBNRh5uXZnzHQ7KO3f8KUExWYp0UwGH
	ri9lSPuI145HIsE9W0x2Jxt2UHEQ7fSHW5K7ntRCWo4HETGVPWLYc/+QNC6doiRl
	VvsFoeJb93zhikUKa2blQ0XeGU5Vf6tjswKgtDTbuCVjyINpXSlLdIl031+CmDnW
	FvRQ6sMH1mof+6wibC6e8gf/peRaCJjFg5H32H4Dk+no0x9rd+qAOOfW1p1uVBCS
	SbysZl0puwmfpQ8h5wX7/dsmRtwxt8E+gW5jX/ZM/tFKLSLnEUaOSSRRgeMmlRFm
	43aWu9gmuPSjRp5rvXQPskxJR+EEb/uE1k74Fug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:luDEjxNWqyE7DwVHSkbbTGTC7o2vvB/GglLuCUyEfgQ=:vVcs7ksMbK36sDnnevWzVwdzxQPoNVcrNSmipQo4dPg=;
X-ME-Sender: <xms:_mwEa2otxRBF__3MIARIgn9jM2tseC0REi3dT8ZBswWT8Gn2SVaBjQ>
    <xme:_mwEa_dlCPAw6uooIulOVYsk1mliEUlzjQRhxiky6dTkCKdVhPQzSUOSpAsFE7-c3
    lYa1S1tcunHGARj8bWHnfs_bfb5zk0K6tItaONK5xB09-ONlYaLn8A>
X-ME-Proxy-Cause: dmFkZTGwAl3jtWkhbe55an4YpobxsYtj4N+AQ5e1xA0RQ7pwu0BxpqaziOKH8L+3ONKrb8
    AmKZrGfaVPRtkn124Xk+zoYCdaFbvlwpbuq84g0S8dTsxBxlDJE/TuIHBoyYJcfdGw+t/B
    YWBs4717WcGylOqDj+VU3vkClFiSA3K0tzfQeHvfKXAsmo/HesmJ2E8vPujZXKdkXIRZ7G
    +r18gUqz2KXX5tl4cUkwQKtwc7a+W3hFlsgMtI3GzUhyL1oL9O2GL1VKk/bChhwb8B40Xr
    o/L8xTPXwQcZyDAbYC7YWtIZJnWdvAhwJ5UeGGJSzu0bJ6wC16epsMsyrHfmh9Azv/RBBb
    svnyJWD234YbBlnIrf7P9TAOud4IB1K5mRTwigaGhG+VerfY96yUTYzEE6b3n9f32f446H
    ZM+R/1hZH9UP03uCuygO5n8h4t5kRveyOoxR1Grf8MT54qOssCjzT+VKCKgn9XyZNbDkM/
    TmaqZBivxdbYUw+V8pN70jKbl0WW1l00jawXzFu468c0ZCiAJ6Fu+7DkOiOePHHvzP2Ry7
    lc1UoS+OmPBuhblVXnvSN4Sa/DdGJymdcqZdhpliLvms1/bN4l5Xcf4+rREPLW2Y4K+HrL
    q1IruJr/pRKdp41VBuegdKM/TkonEWRCjT0LLxUfublZITk9bRanLvCBEWGA
X-ME-Proxy: <xmx:_mwEa9YkTHxI7oXsfPeWsrftP8LDOGrd49JIsyW1EE28vJ9CZKomSQ>
    <xmx:_mwEa2_TfxH0SFPYUl3lGTs-vD-u9mlTPJKwt4TJzAqmIuIRN_sGkQ>
    <xmx:_mwEazmV1P6B6Yi5XxobURqrBoYaCc5wVt1YFXd-VgaqBvuejHu37g>
    <xmx:_mwEa7x0rYqTSFryC5JeCoQJqiPnYthOpmV3dGEQ4fU-0VbcLJPC1Q>
    <xmx:_2wEaxRZiItg7YVKFQwvcrZeoO4doI9Auhrpw647FHbhN3PX8mVtTw2h>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 87C622C00085; Mon, 23 Nov 2026 11:42:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AWoTwGnPVW4R
Date: Mon, 23 Nov 2026 11:42:18 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <ac95c8c7-287b-4e06-b1d8-bd15f5842c06@app.fastmail.com>
In-Reply-To: <5b82091b356a4134ba59e032bd927049b3a6451a.camel@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
 <20261119-lwmi-no-singleton-v1-4-6b06fcfb5126@rong.moe>
 <b5c81884-73b0-4d43-98e5-cd2fedcf583f@app.fastmail.com>
 <5b82091b356a4134ba59e032bd927049b3a6451a.camel@rong.moe>
Subject: Re: [PATCH 4/5] platform/x86: lenovo-wmi-other: Properly implement
 no_singleton driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, Nov 19, 2026, at 1:23 PM, Rong Zhang wrote:
> Hi Mark,
>
> Thanks for reviewing this.
>
> On Wed, 2026-11-18 at 17:27 -0500, Mark Pearson wrote:
>> 
>> On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
>> > The driver declares `.no_singleton = true' but stores device-specific
>> > data to statically allocated tunable_attr_01 variables. This makes the
>> > driver depend on the frigile fact that no device in wild has more than
>> 
>> Minor typo - frigile/fragile
>
> Whoops, I constantly type this word in the wrong way. Sigh...
>
>> 
>> > one LENOVO_OTHER_MODE WMI devices.
>> > 
>> 
>> As an aside - is this really fragile? I mean realistically it's never going to happen is it?
>
> I wrote the commit message like this because depending on global states
> violates the requirements of a no_singleton driver anyway. I will
> rephrase it to make it focus on constifying tunable_attr_01 instead.
>
>> 
>> > Add unique indexes to all statically allocated tunable_attr_01 variables
>> > with some __COUNTER__ tricks, and use them to access lwmi_om_priv's
>> > newly-introduced tunable_attr_01_ctx array. In this manner, move all
>> > device-specific data to the tunable_attr_01_ctx array, and constify all
>> > statically allocated tunable_attr_01 variables to make the driver a
>> > truly no_singleton driver.
>
> If the __COUNTER__ tricks are a bit hard for you to keep up with, let me
> explain below:
>
>> > 
>> > Fixes: 03bb5147da08 ("platform/x86: lenovo-wmi-other: Limit adding 
>> > attributes to supported devices")
>> > Signed-off-by: Rong Zhang <i@rong.moe>
>> > ---
>> >  drivers/platform/x86/lenovo/wmi-other.c | 54 
>> > ++++++++++++++++++++++++---------
>> >  1 file changed, 39 insertions(+), 15 deletions(-)
>> > 
>> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
>> > b/drivers/platform/x86/lenovo/wmi-other.c
>> > index 252ef775f300..f37dca7db034 100644
>> > --- a/drivers/platform/x86/lenovo/wmi-other.c
>> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
>> > @@ -134,15 +134,23 @@ struct tunable_attr_01 {
>> >  	u8 feature_id;
>> >  	u8 device_id;
>> >  	u8 type_id;
>> > +	u8 ctx_id; /* Index to tunable_attr_01_ctx[] */
>> > +};
>> > +
>> > +struct tunable_attr_01_ctx {
>> >  	u8 cd_mode_id; /* mode arg for searching capdata */
>> >  	u8 cv_mode_id; /* mode arg for set/get current_value */
>> >  };
>> > 
>> > +enum { TUNABLE_ATTR_01_COUNTER_BASE = __COUNTER__ + 1 };
>
> __COUNTER__ is like counter++ in C, but for C preprocessor.
>
> This uses an enumeration to retrieve its value (say, 403). Once
> retrieved, __COUNTER__ is self-incremented, so the retrieved value plus
> one equals the "current" value.
>
>    TUNABLE_ATTR_01_COUNTER_BASE = (counter++) + 1 = 403 + 1 = 404
>
>> > +#define TUNABLE_ATTR_01_COUNTER (__COUNTER__ - TUNABLE_ATTR_01_COUNTER_BASE)
>
> Defining a macro does not consume the __COUNTER__. The "current" value
> remains unchanged. That's why enumeration is used above and below.
>
>> > +
>> >  #define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)	\
>> > -	static struct tunable_attr_01 _name = {			\
>> > +	static const struct tunable_attr_01 _name = {		\
>> >  		.device_id = LWMI_DEVICE_ID_##_device,		\
>> >  		.feature_id = LWMI_FEATURE_ID_##_feature,	\
>> >  		.type_id = LWMI_TYPE_ID_##_type,		\
>> > +		.ctx_id = TUNABLE_ATTR_01_COUNTER,		\
>
> This does not consume the __COUNTER__, too.
>
>> >  	}
>> > 
>> >  DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);
>
> Here it's consumed!
>
>    ppt_pl1_spl.ctx_id      = (counter++) - 404 = 404 - 404 = 0
>    ppt_pl1_spl_cl.ctx_id   = (counter++) - 404 = 405 - 404 = 1
>
> ...and so on.
>
>> > @@ -168,6 +176,10 @@ DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU, 
>> > DGPU_DIDVID, NONE);
>> >  DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
>> >  DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE);
>
>    gpu_nv_cpu_boost.ctx_id = (counter++) - 404 = 425 - 404 = 21
>
>> > 
>> > +enum { TUNABLE_ATTR_01_NR = TUNABLE_ATTR_01_COUNTER };
>
>    TUNABLE_ATTR_01_NR      = (counter++) - 404 = 426 - 404 = 22
>
> That's it! In this manner, the C preprocessor stores self-increment ids
> to all tunable_attr_01 variables, so that the latter can be constified
> during compilation.
>
> For your minor note in PATCH 3, I will fix the order when I resubmit the
> series. I will wait for Derek's review before the resubmission.
>
> Thanks,
> Rong
>

Thanks for the more detailed explanation :)
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
