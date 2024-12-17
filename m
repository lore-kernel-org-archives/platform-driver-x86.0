Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FC48493
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396438; cv=none; b=ZT5aY+GITsAcaQzVTyZ7cLv066ChjGoXrWkImLV96JbKjOznmB1u1fI85d0/WRlz3hAeQv9qls5JfrJm1HJA0yFUTvwENpQLe46OH5V1WG+87/mBQVVF/u91Jxu0fETMDry9Mdx2SV+9LvD5389pJTWrVporh/4/lCPFCb2n4aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396438; c=relaxed/simple;
	bh=b9CHctyDQzOzUZjZPRBHN02KpEMFE7mjZxqSDZCliGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ovexww0kydbir1psjuzc8EtDbK1UobTcc/tOIr10IHIekQ/XWYcqCXDzKQ3K+v/iRVMYYYzroStKwOpDn3yjQdTuzQVQOePfP3QsRRzacoxL6whq86LDC/XHcRyuid7qqHNSEMooYPeEElxRLkzmfvCO4m/QGl3D8wI++KlCBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fFqMoiDB; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fFqMoiDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734396434; x=1735001234; i=w_armin@gmx.de;
	bh=b9CHctyDQzOzUZjZPRBHN02KpEMFE7mjZxqSDZCliGA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fFqMoiDB7tFFboKYzyOLPpJNVB6gQhk6JPHxOpkfkYQ8548RU+80/x2bVx7bzBBt
	 F2GCjQoHCL82fB5XQS9uFkVgkJaWBEtWaKmggyZAvpuqw9UcYalvAzfOrXHAymVYP
	 WdwJKkyB4Z8m3Rhwe2X9fyn+S2KdLlkNU4Ip89lL6PjXmQDV6PSG5MzZbpgYWUCPh
	 2fM7fgel4dMI6eMCBgYJtkg4Y5EjMX4h7vg6O3LLse1IqMVX3wGf96Y+fw3zh2jA/
	 8bWR5enWjrVGd5s9H5PGeds7eF4i49JTmPFqao00F4/hzt9PJF7O2BnSB+TwmYjSZ
	 2LRosCUZNLTE1u3P8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXuH-1t5SBi3ial-00LAmR; Tue, 17
 Dec 2024 01:47:13 +0100
Message-ID: <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
Date: Tue, 17 Dec 2024 01:47:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>, platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SARDDSO/dZaSiy4n4SwLxbD0BWIKNnRcaM4b5OS0AtLqGXttMQa
 4V/ZXMCEbs2UjlSLI5jWXXwthkQbIpsuNhufc3eiOTp2sSwRDIaA7b83dmD9iHO1Q2E34DE
 HAF+XuN5EvqqCiDkN/Qy3Mo3tkVcBkpoOeJiYQAKqQIfLQzOuOLy0oJuR/U7e/95mwvqz+J
 vS+1s2u2RC2Im8ZejaizQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ifOYqCoFpaQ=;uQya4kr73rAaW0ndwZ+Lfvq24i8
 ccKVbtiq7ceihe3VIgSzk+pad834mtp2XTg5I8q5TmcBx+OjhgyCBC5Ha+J30j9pMJb6uccB2
 mYmtxRQZ1EqG2wWKFSHQvPXyjHCchaY3Eb+XozyH0jjyqPeWof2nz6Bgvj20jdV9CF7ISKkac
 1fMHqApkpAQvUQRUqs6En/Cmb8HxrJ17Qkep1gBHwV43iWxMiINhqarnJbLvL6kzNQa+gKE9t
 VcUw3XBNIhn9w3xSLO46M4SoAgNk7SQt33iy6Kke+LDe9RdJwZHPdyjXtgMWxMwXBOgR8lhLD
 PBg1OZ57ssOw0zg3iytDVh6jK6FfPgve2FKqmmMyWb4cmyz0glKlgIXHGGkIK3jUaBIJGYoaW
 ZkIrR5wv0DDgoXjMD7ekNufo1f65I9BHAszJB3bsyCyJKmgNDNSBpkYYNbs1I6osqG20LQcJR
 2rBofHyjTmhZrsZxOVsc2p2cnzZYOQDpOHFUWmbJ3qA+GgBRoKRAyOpUHiuX8yGeVdcZMlOEu
 qS8tvKF0YrsZDGdpVHQTHyA48ETPS6BK05rFbHuReqS/oOm15EhAqBYmGer21N0DOnCBsK1UK
 v6vvyzV2lBc6q21Ygw5QQCbOJie0sPq8mPbkuXV6K6luT5opbjHv9rD/XYzcs1RGNkVhk7JXY
 e2j0LTKQkPTx4Q8iiEiV9RphbWpl+C75/JDePGt7w6qB3FXYjEChs0L8e8mjA1sJ7m+x6lOYB
 Jsy3rHvI6y/jHYITCxcrWIYmyXGTg4AEVBBEF4+L9sZV0X38P2Rb7bSGyquRlKe301B3BMOLa
 KKrsLSNl+C22oemd58HIOZh0GHiXklBAsQotEl9HCv70WO30+Qm7F+rDhWUDSkhNTFwEb8Fvj
 SvM5krwCvtNVRG1mUOxyiyFzOdDsVDpaLgY2nO2JrNgAaPeI5q0uGDbRQo1Q3sGjfaqu5YXkP
 qg4A2xprR23QnW1NNHDKL6i3o5cxuTeGWX/0+XFRLP+6DWag9RQpCleoH7QKKm02M9S+jS2rL
 tbQ8kehgpWJ4VQSv6z6sgNap2AO0TjMFnsiMBiDqEXK/1mu38DNY5toJVWcaNvjrxOZHOVVb9
 a/6598LHl7CTQNsiWgmZTbgz8OAz4F

Am 16.12.24 um 07:15 schrieb Hridesh MG:

> Hi,
>
> I'm currently in the process of writing a patch for my Acer Nitro 5
> AN515-58 laptop to support Turbo Mode. The OC WMI calls have different
> input values on the nitro, and I've managed to reverse engineer the
> nitro sense app to obtain them. However, im facing a small difficulty
> -
>
> Currently, the driver listens for WMI events to call the
> toggle_turbo() function, the problem is that on my laptop the Turbo
> Key does not seem to produce a WMI event (as observed by acpi_listen).
> It does however show up on the output of wev with the keycode 433 and
> symbol XF86Presentation.
>
> I'm not sure how to proceed right now since I'm not that familiar with
> the input or wmi subsystem. Any suggestions?
>
> Thanks,
> Hridesh MG

Theoretically you can use a i8042 filter to filter out those special
keyboard events. However i suspect that Acer will not omit such an WMI
event without a good reason. Can you share the output of "acpidump"?
Thanks, Armin Wolf

