Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489D31B111
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Feb 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223444; cv=none; b=BbSrhL9MOsA/Nz+oPynPhLIrxD9vuMOwEuCuySmXqNbjZA+lwmtj41chjPov+a2MFWhlHnsGMR2ic2/wlEXkwgULfgzB297B74SyyTiTfSMevjDqUlTip3m4+9xIrP1rTespf/SoH4dc9j3rXS/AdUcr2vM+3lfBOsS2qgPNuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223444; c=relaxed/simple;
	bh=m0ibNfk2VpA38peHA0RLTgQOXdW7QI9MrxTV+kwDJEk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:Mime-Version:
	 References:In-Reply-To; b=Ul44na2crg+cr0C/yV/WG7O7Gir4NF1RxjtuwlJk5sT5Yt+mUb/geXX7AtvS1FcLufYtF81Gnzb58a8LUoM/JRh5MVXVM+10u0iq0oN6/DVqBTasEw9Z0h2s5OCMEradJ0pra0dMFWHN6YTViMUATCAy1mrkucajWgTgjeoUI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k59AY5yt; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k59AY5yt"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b09f54e98so24856e0c.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 08:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770223443; x=1770828243; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEZEzcXOZREs1cE7ua4SuqPTcMT1oS18cFu1rc3syQg=;
        b=k59AY5ytdY7SJabZXVjdU22tfiiODjzqlPpJGIaPCeL9vh58UuKHweQ2ClrktVDO0V
         NySAMNvupLD3VXxCSxSCBshTZ9f/GCW4HpFTu6KZHK7dymj5Q25C6TTMLW43qNlN55ep
         oQ9N+M6APLtCd2AtNPAZNEw61NlSFTsBOPs3ikZUCzX5+YKomqL3triEN7pMPXOa8Ya2
         DuYLAB5/wQ6NksPTJg22XF3Mp9QB40H6LkmOZhSdTB+T9UeRQlte97xFhsfFlmKszHYu
         TAbjo0uxcWedr8xxl4Uo6HcyydVt26ckYJ3WdSDIHOu54Bg+T7Z4Ha7d24WaDvJnfLqU
         FWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223443; x=1770828243;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tEZEzcXOZREs1cE7ua4SuqPTcMT1oS18cFu1rc3syQg=;
        b=gYQpXS5qvClbXvF5X/ClE/d5WS2AQOBxVo+oJ19FcvQu+WpEvhizol7V4diWziPrVG
         NelY7M9KxLsipu9/KhBghM42sYSFyLnwOzj+QfnzMYQqV6bpRBI9nfJfpKpEEXu6jFG8
         vyTtGceELXmL9+ReDD9xYRBRcmB+ZbA/fA/54b5Ej25kij+q4B1Fi7NV/rHs+ox4DSYv
         ejfALEs2/BJPdApXPJF8NFXumV7LbzO1Hr/8x/rRXcRqLtm3za9y0AQdMz+YgOWaN7xY
         bblBlX/Cw2IW+wpCbc5XEB4jQ5vSTuW/jyFKXky0104rLkjdZy4/Z0qTqNXaLPxHl6w7
         VoXQ==
X-Gm-Message-State: AOJu0YxZtKE/aAGI/oYaC1VKxhN7gXpDUXLkgBvrDnW4/zoHeAqQO9w4
	wMMc2/ClMfENw5cgq7PtXIzxoZ9/JgUcaqsFIW+6+8spKO1f2YUkocyV
X-Gm-Gg: AZuq6aKfrNVEAcaNVsj2Erx1jB7YPPwcaiPwYNEp8gjBq7Wdl5Todh7EV9SO0eptvDK
	vlAGZFbyraxW8HKtVvcUk4pkYkT/JWDCV5rGutFfm3V4okUVv51ZbQEWgR9+k+wghlCmIfu/RDG
	tkORyHXaLi/kQrw7PSHUXNDfjRMuSaFNo3Cd6HOW6zws4uFIF0Dl/zYmk/imusVJYbLJFuvDnpy
	n3gHaqakyUdZok1Qs+f0MtplsS1ZUVfNkB4iMOcLZKsZy1YjwDFksLmpQuldcgT/FvOc5zQmvmF
	LnAP7wvPjvgQkoqUmLaEZyYFqP6MrAek+GAViul2jGoz7t3wLsquJkdVULva/w/wd+mCqmY6nU7
	8C7S6xaxUg5JrLedyt1tGDQ+KC8hIFlWI4w7VHiluHiX7W+MpUBBCKBesSXcuk2Pj4eEuaV9NAs
	cTD0ZZd6GkY2pe
X-Received: by 2002:a05:6122:2a11:b0:559:6960:be0d with SMTP id 71dfb90a1353d-566e80b599cmr1308891e0c.13.1770223442888;
        Wed, 04 Feb 2026 08:44:02 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e8229dadsm1287871e0c.18.2026.02.04.08.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:44:02 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 11:43:56 -0500
Message-Id: <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Rong Zhang" <i@rong.moe>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: <platform-driver-x86@vger.kernel.org>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
 <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
In-Reply-To: <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>

On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail.com> wrote:
>>Hi all,
>
> Hi Kurt.

Hi Derek,

>
>>In my system (83KY Legion 7 16IAX1) the current_value of any of the
>>firmware attributes exposed by this driver always reads 0
>>
>>	$ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/
>>	ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>>
>>	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/*/cur=
rent_value
>>	0
>>	0
>>	0
>>
>>After investigating my acpidump [1] I found that the argument passed to
>>the WMI method Arg2 is matched as a whole integer instead of individual
>>bytes (L: 49203)
>>
>>	If ((ToInteger (Arg2) =3D=3D 0x01010000))
>>	{
>>		Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_.F5E0 */
>>	}
>>
>>	If ((ToInteger (Arg2) =3D=3D 0x01020000))
>>	{
>>		Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_.CCP1 */
>>	}
>>
>>	If ((ToInteger (Arg2) =3D=3D 0x01030000))
>>	{
>>		/* This case (CPU FPPT) is actually just zero... */
>>		Return (Zero)
>>	}
>>
>>...and the driver always sets the second byte of Arg2 to the current
>>profile (mode), which is never zero!
>>
>>	attribute_id =3D
>>		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>>		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>>	-->	FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>>		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>>
>>So it never actually matches the attribute and falls back to zero :/
>>
>>This is however, not the case for all tunables. As you can see in the
>>acpidump, just bellow the block above, these are matched depending on
>>the current mode (second byte)
>
> This typically means that the method is stubbed so that it returns 0 on i=
s_supported. During development I forgot to go back and add a check for thi=
s when adding the attributes. Per the spec, there is no profile that corres=
ponds to 0x00, so this is working as expected when showing an unsupported a=
ttribute. If you add a debug print to the capdata driver when it is queryin=
g the attributes you can see the entries are empty.=20

Hmm it's weird because if I read

	\_SB_.PC00.LPCB.EC0_.F5E0
	\_SB_.PC00.LPCB.EC0_.CCP1

directly, they show the correct SPPT and SPL values shown in the windows
Legion Space app (under Custom mode).

It seems like these are supported?

>
> Coincidentally, I'm planning on submitting a series this week that adds t=
he missing check for is_supported and also adds the not yet implemented att=
ributes. If you want to take an early preview, it can be found here:
>
> https://github.com/pastaq/linux/tree/pastaq/6.18/lenovo/wmi-next
>
> With this you should only see attributes that are supported.

Same problem, see bellow

	$ fwupdmgr get-bios-settings

	gpu_oc_stat:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the GPU overclocking status
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	cpu_temp:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the CPU thermal load limit
	  Read Only:            False
	  Minimum value:        85
	  Maximum value:        105
	  Scalar Increment:     1

	gpu_nv_ac_offset:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the Nvidia GPU AC total processing power basel=
ine offset
	  Read Only:            False
	  Minimum value:        10
	  Maximum value:        80
	  Scalar Increment:     1

	gpu_nv_cpu_boost:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the Nvidia GPU to CPU dynamic boost limit
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	gpu_temp:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the GPU thermal load limit
	  Read Only:            False
	  Minimum value:        75
	  Maximum value:        87
	  Scalar Increment:     1

	ppt_pl1_spl:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the CPU sustained power limit
	  Read Only:            False
	  Minimum value:        50
	  Maximum value:        110
	  Scalar Increment:     1

	cpu_oc_stat:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the CPU overclocking status
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	ppt_cpu_cl:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the CPU cross loading power limit
	  Read Only:            False
	  Minimum value:        30
	  Maximum value:        75
	  Scalar Increment:     1

	ppt_pl2_sppt:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the CPU slow package power tracking limit
	  Read Only:            False
	  Minimum value:        60
	  Maximum value:        168
	  Scalar Increment:     1

	ppt_pl1_tau:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the CPU sustained power limit exceed duration
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	gpu_nv_ppab:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the Nvidia GPU power performance aware boost l=
imit
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	gpu_nv_ctgp:
	  Setting type:         Integer
	  Current Value:        0
	  Description:          Set the GPU configurable total graphics power
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

Also it still shows SPPT and SPL as supported (which is coherent with
Legion Space).

--=20
Thanks,
 ~ Kurt
