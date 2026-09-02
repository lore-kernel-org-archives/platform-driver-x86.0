Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55041D4F3
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387260; cv=none; b=tTHpR1dq+xeKgZqlGDgYZ+YO1TS7efDvwHzQ+7qa9H1p8N1PI+PGPaP7PoLSyrJMDAZT5w+3NKlxwAacTKNXRi98cEF8XX4NYRzLUPie+464TCZrByX9ykfL6Yn7T9+d6898rVV07LrcT0ivkdekvA8dwL6JrhT76eFqSfjiw5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387260; c=relaxed/simple;
	bh=OopvGY9gCBZTSFhpAnMtdQSSjuYoLwZWSOqKMnXURBU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NqB4grUcQxRneGRKa6ZRh2xtpuUrGRpYT7Xp7gCACXClV8NwkDgMRfI0mqw2vGLiNAEAuVIugUq+Ax2D4MqIKIBnfWoESWf/9YUa4AF8k3ORmzIii9Q9bQzV8uGT37/xUflr1MGU03MObxu41mai7NSf4EeYzkAkQUwP+1SIp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lweTjSTK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lweTjSTK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso12177575e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387254; x=1788992054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/39z5eRSf/qo17Jn6zcSnmGPZdSaHyHqGH2GAWABfsw=;
        b=lweTjSTKrelxyAlgcQTep+7dqaqYF6CqRds/aYnyYP2+s4I0i1Ou35cuiF9B8awr27
         obwIOTcUg9QYJ9DV4CZoMIXzIdRpGTArYAyZXzSEk3FiRLPje55oRmQ5Q6pHqzW2LjQK
         kLNU/ezXvufacBetslHGPo6v11/k57KnVfBe5hCBLx4ERaHYf1zPlwRA4rvN2rXGd+XQ
         zXZqmCYHZ7cxJTArDL3ZwBQksgYtIbgjmRkvXS1BK3MmnV0uYXaqDfXtg9prh5vn+cOu
         +56Eyvafbg37WPtukdyZedcWjX9GrlyrzU+L7fQy88U3cE3gCKudLCuMEja8wHh4jZdn
         SecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387254; x=1788992054;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/39z5eRSf/qo17Jn6zcSnmGPZdSaHyHqGH2GAWABfsw=;
        b=Z2GoL1/gDQlrDfMkEMWg8bIU1KpotWYIOhyzCHJM6pYDxllR4ZZ1wSOsucd6NgTLgN
         HDtlgDNB2QgKzQf18BZ+IiVrHYzK87pQ6+g/YL+artiA2wgdHd94s0zxGw8pWz6JRMnH
         IHCjyO4SyVEilf00lYaHG4C2WnUpuI+yGC9NgR1A0frLrVtwd25W2vXZXdUZTg0Zgk6q
         pfPoslgOaSN+wuaQikHf1gMDaZy9lwKqGAqIgEcKOVYLJjbOsBrADptSEQkCuTrN9V6U
         knt9TgB08Brp8nguvqS5OJ978SL4QxvGu8A4mFBvEFttpj0yzLHmkrTtyYvdDGzSejW3
         MLww==
X-Gm-Message-State: AFuF++kUlmzNYWmGEfVan1sfZZ1F1WruKzPcek6PGT3IaYk58MCMNG+p
	tSgLzNZ9f4h5IJPut2vJ6U0sPlDpRMSKNpEw96t73Dx6VbGo2tr++qCe
X-Gm-Gg: AYBFou1FaG+qJfGhsANkmo20cgCuJtFA7XR6YL/pjPaxkn90op3Oc5EhMRs/WQe2wpk
	NApgsUIR+Vszy2l7VfGinQHTR2SwWFgyxl0+cN2ZSn3DM93ei2ACmdoGgojXrlQk1wE7LQu9uzj
	0qwN9ZKMp/fhqnlD+EEGCZ8ZEHm2kBpTx6Bwx7GCF2LMHXOSHNodGRWrE/uQ4BDK2rC2YS0HR7N
	N2H3qbpapYFyADsjUbcAeN6ilTrE+sLdL41IGlR2XIvpgUuMD2Yg4fdZWyTKgSaK1PWqSzHdGN2
	waKUU+leMrLo54Cx0Cx5hvKfFYLmwZtl2p231jGNT+0rnVsvzdgURwqAaxuYip0GtM2fh643yFC
	ZLl7GDILPb0EOu8uuvXt0lnKT/eVcd93rj9Unq6U3v9FJJ5V6tHKtHAu0+40Y+v1bnBTaTYsb4J
	d0J4WMhxR98Z6h2gbc/qbxkajziZsIqbXNjt/4UM09jrrN/zFOCZ6SBDe2t1LxoxuPFCgQ/nX9z
	FwJHKM=
X-Received: by 2002:a05:600c:1f87:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49ce5818132mr135642125e9.10.1788387253891;
        Wed, 02 Sep 2026 15:14:13 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a02:b027:8012:2513:bc11:fbff:fed5:af63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f914bsm24603705e9.3.2026.09.02.15.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:14:13 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:14:10 +0200
From: Denis Benato <benato.denis96@gmail.com>
To: Ponali <ponali2k@gmail.com>, Denis Benato <denis.benato@linux.dev>
CC: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, luke@ljones.dev, deor001@gmail.com,
 Salvatore Bonaccorso <carnil@debian.org>, ponali2k@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/x86=3A_asus-wmi=3A_?=
 =?US-ASCII?Q?fix_unclear_usage_of_bd-=3Eprops=2Epower?=
User-Agent: Thunderbird for Android
In-Reply-To: <985b98f7-04a3-449b-ab6e-7f23e29e4b43@gmail.com>
References: <20260819205353.1651888-1-denis.benato@linux.dev> <19443596-887f-4f06-ba74-c75637d6913f@linux.dev> <985b98f7-04a3-449b-ab6e-7f23e29e4b43@gmail.com>
Message-ID: <895FD15B-6CE9-430D-9CFC-C4C306E803BE@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Il 25 agosto 2026 13:38:01 CEST, Ponali <ponali2k@gmail=2Ecom> ha scritto:
>Hi,
>
>
>I have applied your small patch,=C2=A0based on the diff you gave me, and =
the ASUS ScreenPad display has started working=2E
>
>
>I'm not sure what commit I was supposed to patch though, so I guessed 9bd=
6ec=2E I had to patch it manually because the line numbers weren't matching=
, and you sent me the output of git diff directly instead of the contents o=
f a git patch file=2E
>
>

Unsure, I don't think that was the output of git diff because I had a =2Ep=
atch file made with format-patch=2E=2E=2E Anyway=2E=2E=2E Unimportant=2E

Sorry for the delay: got dragged by other things=2E

>
>The custom compiled kernel created couldn't handle the brightness correct=
ly, only the power:
>
>On KDE Plasma, changing the brightness is possible, but the maximum brigh=
tness was set to be darker than usual=2E
>
>On both brightnessctl and sysfs, writing to the brightness value would ch=
ange both brightness and actual_brightness, but no changes would appear on =
the backlight=2E
>

Can you please elaborate? I don't know the hardware well=2E=2E=2E=2E And I=
'm not understanding very well: actual_brightness changes but doesn't refle=
ct on the hardware?

>
>Booting to a disk image of pre-6=2E12=2E90 linux with XFCE has the same e=
xact issues, but then after booting back to my normal 6=2E12=2E90 system, t=
he maximum brightness came back to what it used to be=2E
>

So I solved the regression, but something else is not working?

Maximum brightness as in physical sense or sysfs?

>
>I hope this heisenbug only happened because i simply patched the wrong co=
mmit=2E
>
>


I work on top of the review-for-Ilpo branch of PD/x86=2E=2E=2E

>
>On 19/08/2026 10:55 PM, Denis Benato wrote:
>> On 8/19/26 22:53, Denis Benato wrote:
>>> The bd->props=2Epower is checked in parts of the driver correctly comp=
aring with
>>> BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props=2Epo=
wer
>>> and !bd->props=2Epower, moreover in certain checks the logic has been
>>> inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wr=
ong
>>> usage and the inconsistencies by using proper comparisons=2E
>> Can someone having the regression please try this out please?
>>> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/b=
rightness handling")
>>> Closes:https://lore=2Ekernel=2Eorg/all/178362762638=2E911488=2E8564892=
548331679884@eldamar=2Elan/
>>> Closes:https://lore=2Ekernel=2Eorg/all/ea9c63d1-4776-49d5-9dc4-6c09498=
f99c9@linux=2Edev/
>>> Signed-off-by: Denis Benato<denis=2Ebenato@linux=2Edev>
>>> ---
>>>   drivers/platform/x86/asus-wmi=2Ec | 12 +++++++++---
>>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/drivers/platform/x86/asus-wmi=2Ec b/drivers/platform/x86/=
asus-wmi=2Ec
>>> index 8610663b8269=2E=2E3600dddd8f36 100644
>>> --- a/drivers/platform/x86/asus-wmi=2Ec
>>> +++ b/drivers/platform/x86/asus-wmi=2Ec
>>> @@ -4500,7 +4500,8 @@ static int update_screenpad_bl_status(struct bac=
klight_device *bd)
>>>   	u32 ctrl_param =3D bd->props=2Ebrightness;
>>>   	int err =3D 0;
>>>   -	if (bd->props=2Epower) {
>>> +	switch (bd->props=2Epower) {
>>> +	case BACKLIGHT_POWER_ON:
>>>   		err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, N=
ULL);
>>>   		if (err < 0)
>>>   			return err;
>>> @@ -4508,12 +4509,17 @@ static int update_screenpad_bl_status(struct b=
acklight_device *bd)
>>>   		err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl=
_param, NULL);
>>>   		if (err < 0)
>>>   			return err;
>>> -	}
>>> +		break;
>>>   -	if (!bd->props=2Epower) {
>>> +	case BACKLIGHT_POWER_OFF:
>>>   		err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, N=
ULL);
>>>   		if (err < 0)
>>>   			return err;
>>> +		break;
>>> +
>>> +	default:
>>> +		pr_warn("Invalid screenpad backlight power state: %d\n", bd->props=
=2Epower);
>>> +		return -EINVAL;
>>>   	}
>>>     	return err;
>
>
>Regards,
>
>Ponali
>

