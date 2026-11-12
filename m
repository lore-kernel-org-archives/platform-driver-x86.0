Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521213;
	b=bAGFxdxLnLf2ubAmbbsN6XnOvyEkdH7efPstYB1jd/DQPxTCDLQWUDKJPDN+UMMSNTaR
	 PRdG2gJ0lAYmvFjoW270rz+xE8xb08GVY/dMUy4sL39tLsyk1KHCc+qA2pvr6gk3HO+gg
	 4+HOGic/01e2+xp1mCB5ygF5Aqt2wFWoxZDwJehx/d4WZyGkehjyKjDdSvBEqUpj21KvL
	 dHdnAW2pArVXriK5ATfU5usX9ZiVmd74LliNVgQiKcT7+RNpM/R2dw2bbODoe/5Jxaxyd
	 Ul0ZxLywNCGmf1pB2eVGPa0BrIJEvU/ot8job+vBS1ZH7ru04odrTeTfThKyRnBSgfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521213;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=ZOUNA7ThaLwNSTsfnKW/sRxXCEfXwPf2Lqwrs4CTC20=;
	b=2QGTOOvMgrMKhDGEIs2OCs0IjSaDRZfByfyeEfVFbiwV7ls+okNFcTL08EiPc7DM/Zs0
	 nshzqgZmHNuDWN1G7joxzCIHcuPPH9lsKe2kI9xf0m91h8k4+DipLfmb/hKlk1V4CtQqS
	 2Uy6eh3cJo6XMV1iv+6SE5oYsfQH+F0LZ9RxA5Kp1Xzmer8Wz26+iVvujZt0eji0z7GzL
	 EcedrXJtti7FQ0Zi/xyvvbQyswEJEb+EbO50xCRfG9HYtot7TMskIuHjTPuhPZ1VsL6p/
	 E+NO+miATWmCwIq2hoLjYtNTH7xysA6f9dJ0GBZHyXFc77rlUQKGIU3L+fEyWy5BPUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KfI1K7Ji;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5D606A332
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E5D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KfI1K7Ji
DKIM2-Signature:  i=1; m=1; t=1794521210;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Rl7jq3yeeU8Ycp4rrQU11/OASSYT
   kfuguGA5zH0zbMU+AcMoM78FcN+WvsPBew9dk/697hqmDCChuZcObA5IedMGPBM5tMjBsnRyo6Z
   UNvyH0M9kAVa7U+kASHFI0HUFoLg25oHmUQ2cGNW4r+VMmJN8Q9ebGK1zGNDc6u7fCSLjs9GzBR
   7QPaqwPlx5NiU9B5lIDk4TwoqngC4a6rMBdvMt4bslPvJusSpmtreaCuNopmVLRosflycM+TybQ
   AxvIA2kCYXjNAObkaWu0NGIn9+//1npyjfAon7rikGJ9ebOf14Y+1rrOeyeSY/Qv5zTHsRq/Hj6
   N1PY3CL5SRusXw==;
Message-Instance:  m=1;
 h=sha256:
   fqFlLSP0p4yBdPPdRN1COcrY7F+lv+fOfDeMFQ+99D4=:
   ZOUNA7ThaLwNSTsfnKW/sRxXCEfXwPf2Lqwrs4CTC20=,
  sha512:
   qQcgWgitfyWWAG0F8AlxV9CpEmM11L7aAmxKBfx7sxQ7OlXcCBJGILpS6yTlPrQXl0tqqO85aKybdrRcmAMgQQ==:
   Z3MJLLKI7KjvoZq9FvLLlyI9aw2bVkeRU6WlN7Lw286HUdgqMcKFcJtphwJXp/Rjk7N0wDAZaCyH7GZh2m2AJA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794521206; x=1795126006; i=w_armin@gmx.de;
	bh=ZOUNA7ThaLwNSTsfnKW/sRxXCEfXwPf2Lqwrs4CTC20=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KfI1K7JiZ8vZIlqIoa2nDyqh7UerIbsBCO7bRNiRpB6b384sAmfRfZ9T+ULOo18R
	 QmBO58sp0EdTbnLMv3SEqr4StzvWXfMNfqfR0j47dwPblW66H1vE/WKIdRVdAaJBU
	 gsM5sD3I/B5k1a99ee3WBX3AzRh10Cj2iFugaG/4019pWXYxrqSi1fJf/WJk7bv1i
	 bcI65oc8su+08slFW0O78G152T5SNlwIyz3qLLfKDUnB6IhG+MDo9+EwIrJx5td6p
	 MqPenbLKyZU99B7bsWD6oskFtiUzVGgKQus9XDfdCd4Ow6VS/0W1MI4q9ddGS0eSi
	 GauaUTpWsO/gSyfEfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1x0iO73xli-00Sayv; Thu, 12
 Nov 2026 23:06:46 +0100
Message-ID: <0303be37-e67e-46d2-973d-0111a0bf828e@gmx.de>
Date: Thu, 12 Nov 2026 23:06:44 +0100
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
Subject: =?UTF-8?Q?Re=3A_dell-smm-hwmon=3A_Dell_XPS_13_7390_=E2=80=93_fans_n?=
 =?UTF-8?Q?ever_spin_up_in_EC_auto_mode_=28CPU_reaches_82_=C2=B0C_at_0_RPM?=
 =?UTF-8?Q?=29?=
To: Tobias <tobias@feldmeth.de>, platform-driver-x86@vger.kernel.org
Cc: pali@kernel.org
References: <412372e989bcb3d2376bc4437a9257bfe94ec850.camel@feldmeth.de>
 <4c98aa15-c9a5-4e48-a9f4-66abba17744b@gmx.de>
 <1ae16be741d52ae3cb79fdb014b88a5d778bbaea.camel@feldmeth.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <1ae16be741d52ae3cb79fdb014b88a5d778bbaea.camel@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Lv4sTKqUvJyYnRluqFqvVABP/3h7QQu/jRoDuXLPFKI0lZ1YyqP
 mjgzK7t2/0rD/f8a1GEsAk9TCxAaIf46X5wW+vxp3KnzWOH+Oag76hPq6SyO3x274VPozgy
 dBEcqgGKzAZCbsTlaobUiIzSZDlC6qYhGCqfHTHgObnJgEDIpEiTzou2otxhC66QCQPCFFh
 WH9UPKPsz4TvXxAwLyrHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w2cJuZP+idE=;rVcojXQTg4juf9osVo0RIpnVwC6
 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
 GN78sIuUw==

Am 12.11.26 um 23:03 schrieb Tobias:

> Hello,
>
> thanks for the quick response.
> thermald is already set up.
>
> tobias@tobias-XPS:~$ sudo apt install thermald
> thermald is already the newest version (2.5.11-0ubuntu1.1).
> thermald set to manually installed.
> Summary:
> Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
> tobias@tobias-XPS:~$ sudo systemctl enable --now thermald
> tobias@tobias-XPS:~$ sudo systemctl status thermald
> =E2=97=8F thermald.service - Thermal Daemon Service
> Loaded: loaded (/usr/lib/systemd/system/thermald.service; enabled;
> preset: enabled)
> Active: active (running) since Thu 2026-11-12 21:46:07 CET; 1h 10min
> ago
> Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
> Main PID: 1274 (thermald)
> Tasks: 5 (limit: 16591)
> Memory: 3M (peak: 3.7M)
> CPU: 17.761s
> CGroup: /system.slice/thermald.service
> =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enable --adap=
tive
>
> Nov 12 21:46:06 tobias-XPS systemd[1]: Starting thermald.service -
> Thermal Daemon Service...
> Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID levels;
> family:model:stepping 0x6:8e:c (6:142:12)
> Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID levels;
> family:model:stepping 0x6:8e:c (6:142:12)
> Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode is enabled: 4
> Nov 12 21:46:07 tobias-XPS systemd[1]: Started thermald.service -
> Thermal Daemon Service.
> Nov 12 22:56:29 tobias-XPS systemd[1]: Started thermald.service -
> Thermal Daemon Service.
>
> Thanks for the feedback.
> Regards,
> Tobias Feldmeth-Walter

Strange, can you please share the output of acpidump?

Thanks,
Armin Wolf

> Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb Armin Wolf:
>> Am 12.11.26 um 22:01 schrieb Tobias:
>>
>>> Hello,
>>>
>>> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu, kernel
>>> 7.0.0-
>>> 43-generic) the embedded controller does not engage automatic fan
>>> control. In EC auto mode the fans stay at 0 RPM even under full CPU
>>> load.
>>>
>>> Observations:
>>>
>>> The dell_smm hwmon device is present, with fan1/fan2 (fan*_min=3D0,
>>> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
>>> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is expect=
ed.
>>> Test: I stopped my userspace fan controller, wrote pwm1_enable=3D2
>>> (accepted without error) and loaded all cores with yes > /dev/null.
>>> CPU
>>> package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s, 73 =
=C2=B0C after
>>> 30
>>> s and 82 =C2=B0C after 65 s, at which point I aborted the test. Both
>>> fans
>>> stayed at 0 RPM the whole time.
>>> pwm1_enable cannot be read back (Permission denied, even as root),
>>> only
>>> written.
>>> Platform profile is balanced (choices: cool quiet balanced
>>> performance). I did not test whether other profiles change the fan
>>> behaviour.
>>> thermald is running and has no effect on this.
>>>
>>> Workaround: a small userspace daemon polls the CPU package
>>> temperature
>>> every 2 s and writes pwm1_enable=3D1 plus a PWM value to pwm1/pwm2
>>> (off
>>> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with hyste=
resis). On
>>> exit
>>> it leaves the fans at full speed. With it, the system cools
>>> normally.
>>>
>>> Questions:
>>>
>>> Is this a known firmware issue on the XPS 13 7390, and is there a
>>> BIOS
>>> version that fixes it?
>>> Is a different SMM call needed on this model to re-enable EC auto
>>> control, or should the driver do something on probe/resume?
>>> Which additional data would help? I can provide dmidecode and
>>> sensors
>>> output and test with dell_smm_hwmon module options (debug, force,
>>> restricted) if needed.
>>>
>>> Thanks and best regards,
>>> Tobias Feldmeth-Walter
>> Hi,
>>
>> i think we had a similar case not too long ago, and the solution was
>> to setup
>> thermald.
>>
>> Thanks,
>> Armin Wolf
