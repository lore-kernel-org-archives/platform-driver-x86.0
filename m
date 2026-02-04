Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B12F7AD2
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Feb 2026 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194216; cv=none; b=RbNjqcx11rnanl+aiYuUeb7FwqJzxKw3WqD0bc7k/PFbfHW95XgcPyPIzrTYe2ctp+2FEJgIBeEQ3/JE+v8s/kxldLQNq2vr+ugHRy4RUso/QleXO6HMXKvn5rqYevVr1cuUsIatUQ/PH7HLi8LfAyFbxUHi6Z62BzoUBeqNYew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194216; c=relaxed/simple;
	bh=iq3xyRFM7qFSdM4o3j5Iu88Bu8mKaFAt4+Q2o/T2wUc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PcJqFEt4mFO+u/Qzv5361xYGC2okaH1ItS14mgZH7+g6WD1DIiyhSzUVVzsbuCfwlRHBSAKwxs4XK5oqFuJH5cVm6iSNZYorHz+dwwX2YgGUTpM6FcNbn+ppycbJfsrgw8YIK7X1yt3ejMn0lzHLd2hjzPVue2sfIsJ5gC7AH0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8Ceqtnd; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8Ceqtnd"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b740872a01so2164460eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 00:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770194215; x=1770799015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WA8wvVv83Tyi1LaZOLxF/sJRsQuMb2l4+4BXwe8g6L4=;
        b=G8Ceqtnd04CD0zVby5QiWLdMlFZDR+tog7S5HqUCkfjunizyRSdWNExVacSsIBrEp7
         F3Iaqt+zrm/kG1DHDX1s9qCh6wH1zcE7ObI6dCKO6CjAGPrPCfQIjkxYdXc2fzNCR75Y
         uB9Ct8I66ZXhMujIqjfdOMn6m1bSgmssIAAjuW230ChQjqY8ewle9gN1gBiLc5RZZcsf
         lpNVE246Ldn1vfPU0hOPtMGxjrcH8wO9csHviKTud8OHpyT4RzV8mhnMsbXYH83oCq69
         3eobfMKvEXh64CKToNGKG8oJEmRG+f3Y35cE962DFW9V+z3NqmqY11rQnDBXNY9EcXOY
         /wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770194215; x=1770799015;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WA8wvVv83Tyi1LaZOLxF/sJRsQuMb2l4+4BXwe8g6L4=;
        b=I7zbk7QCl9/stCBxxfkToF0xn+f05bVffLwt9T6ysfraurzvQfu0Xp8gAFnajI5k4r
         FfALwu9eFG9AEvx0F/IIkqbwa4GyGIHO28ibQ+AiCbbqoZVD4Hai25JJ7D75UOrQ38++
         t+MWfTuoIZbwdhInh1HKYUcWokZyyxoqg4+F5LWph57jfauyl2JzArIk5nOdzSsBSdfK
         q/PLK5xp7SPyQjCoqKD/1fH3Ko7POWS2TiiVLc+G4ROFCJc406yeAScflNE7slx+oMVJ
         KZ2WiRqopvxLGYGGK6Oa+SPef4xAgtT5ZrhDowqALvqtTYfK81E1crLqjdlJk5R17XZh
         gryg==
X-Gm-Message-State: AOJu0YyFNUbmoHHCN2p3tNKzNBuZD4xjzBIBBS1CkMjyJmimnNmr82nj
	dsJLyXizc4OaOdvcOsbA5nO6d/WHMSYvL6HokMjdwFOlYSCvc485Pxfs
X-Gm-Gg: AZuq6aK/FHxDGsd+s1f6o2AfbbXS1ttxkNai1ZncwNj+lCAOlFQCx/GZMSbZ4y9c89t
	+E7eEvupGWaI9dPQafho5bvd3LnzP1Z4QVh1H4NsA9xo37eJqlnNa7wZ2vuuFJp/ksEOF2f0lj/
	HnzdpqHGsZlX9oaBLrvydUq32kpmoHwegjKGg7C44IYWoVLxZ9F3aNtt/vrhPvh8IVRupkk7AlB
	a/bywHc1zE6FvJtfpnA2p1NPBCkXhlbZO+5+Mpu7H+WGQooTfpsDbDaxUS2UTSrq8hHc023Z5rp
	TKjocI+5baqa+7QPviCj/wtjpSQDhQj0DzKZ4W4GXU9iWrrLuPB8Ti4eLzN1g159zELPgxXJh3P
	NCmzsAijdRMY6zAM+P2HFW9AR/6+/Y/FkTQVa1nglIo1pVZndis7VM2dNcQ4stRy0LEaG5Cd3T/
	0UuYf6pvK8am8YhbN+EKeb14QlZagcFZGWLbZfFsyHzTYgGoFjVseyOeRRvYQFivUjJNqcPabeE
	0uH6Ap7oQ==
X-Received: by 2002:a05:7300:d705:b0:2b4:5b59:af52 with SMTP id 5a478bee46e88-2b8329c2481mr968206eec.29.1770194215137;
        Wed, 04 Feb 2026 00:36:55 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fb564fsm1136131eec.25.2026.02.04.00.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 00:36:54 -0800 (PST)
Date: Wed, 04 Feb 2026 00:36:53 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>
CC: platform-driver-x86@vger.kernel.org
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
User-Agent: Thunderbird for Android
In-Reply-To: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
Message-ID: <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail=2Ecom> wrote:
>Hi all,

Hi Kurt=2E

>In my system (83KY Legion 7 16IAX1) the current_value of any of the
>firmware attributes exposed by this driver always reads 0
>
>	$ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/
>	ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>
>	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/*/cur=
rent_value
>	0
>	0
>	0
>
>After investigating my acpidump [1] I found that the argument passed to
>the WMI method Arg2 is matched as a whole integer instead of individual
>bytes (L: 49203)
>
>	If ((ToInteger (Arg2) =3D=3D 0x01010000))
>	{
>		Return (^^PC00=2ELPCB=2EEC0=2EF5E0) /* \_SB_=2EPC00=2ELPCB=2EEC0_=2EF5E=
0 */
>	}
>
>	If ((ToInteger (Arg2) =3D=3D 0x01020000))
>	{
>		Return (^^PC00=2ELPCB=2EEC0=2ECCP1) /* \_SB_=2EPC00=2ELPCB=2EEC0_=2ECCP=
1 */
>	}
>
>	If ((ToInteger (Arg2) =3D=3D 0x01030000))
>	{
>		/* This case (CPU FPPT) is actually just zero=2E=2E=2E */
>		Return (Zero)
>	}
>
>=2E=2E=2Eand the driver always sets the second byte of Arg2 to the curren=
t
>profile (mode), which is never zero!
>
>	attribute_id =3D
>		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>	-->	FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>
>So it never actually matches the attribute and falls back to zero :/
>
>This is however, not the case for all tunables=2E As you can see in the
>acpidump, just bellow the block above, these are matched depending on
>the current mode (second byte)

This typically means that the method is stubbed so that it returns 0 on is=
_supported=2E During development I forgot to go back and add a check for th=
is when adding the attributes=2E Per the spec, there is no profile that cor=
responds to 0x00, so this is working as expected when showing an unsupporte=
d attribute=2E If you add a debug print to the capdata driver when it is qu=
erying the attributes you can see the entries are empty=2E=20

Coincidentally, I'm planning on submitting a series this week that adds th=
e missing check for is_supported and also adds the not yet implemented attr=
ibutes=2E If you want to take an early preview, it can be found here:

https://github=2Ecom/pastaq/linux/tree/pastaq/6=2E18/lenovo/wmi-next

With this you should only see attributes that are supported=2E

Thanks,=20
Derek

>
>	If ((ToInteger (Arg2) =3D=3D 0x01080100))
>	{
>		=2E=2E=2E
>	}
>
>	If ((ToInteger (Arg2) =3D=3D 0x01080200))
>	{
>		=2E=2E=2E
>	}
>
>	If ((ToInteger (Arg2) =3D=3D 0x01080300))
>	{
>		=2E=2E=2E
>	}
>
>	If ((ToInteger (Arg2) =3D=3D 0x0108FF00))
>	{
>		=2E=2E=2E
>	}
>
>The fix should be easy for this device but I don't know how other
>compatible models handle this argument=2E Hopefully we can find a solutio=
n
>that works for everyone?
>
>Thanks for looking into it!
>
>[1] https://lore=2Ekernel=2Eorg/platform-driver-x86/DFPEEI5LNJXZ=2E2E32AH=
A8VUJW3@gmail=2Ecom/2-acpidump=2Etxt
>

