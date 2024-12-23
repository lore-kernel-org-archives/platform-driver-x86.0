Received: from sonic313-11.consmr.mail.ne1.yahoo.com (sonic313-11.consmr.mail.ne1.yahoo.com [66.163.185.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9311917D8
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734958066; cv=none; b=Zidom4z18wTr6U3a3vnBQ3uC0g/s6HIpTVTBcJnF6wx9CqD6zyWaQ0gbC+USZWeo4lTfXHu4tEVZm1/y6B5KZtZSMBQrqEoSe8gmQVvQa3Cu6D2e8T5AzWKJMDNhGW82GcUM6Y1Pn8XzTHG20cGBM0HQeooVeK1pdbDIN3/VhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734958066; c=relaxed/simple;
	bh=SFDvp65UXucG95My0NCMoG9DMWjYaLxYi6XljYVz7m8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=d8PqV9KUeIAObB0BuUydAa5PjEp6Imw0rNvWIPu7K/2c5hTV0r1PklXjn0cQmwrmXnwpqNRpCGS2S1URDzL0q+PBTcpuMWdZBqJce0YZXY1jc8CdoCPLoSc/AdeZpRK059nDadwmtCu0bpkKzedYuVbKQUmxn+MbW5yK5rNUKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=none smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=cOo/thRm; arc=none smtp.client-ip=66.163.185.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="cOo/thRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1734958056; bh=1SFCKeUZ4evQ9IkB0o79QdNcOLXxXAayz+IyLahasdQ=; h=From:Subject:Date:References:Cc:In-Reply-To:To:From:Subject:Reply-To; b=cOo/thRm1h5kQQHJPPrmmLg9ldz9IMkflUEu84qYsMsqJPS/q9sos2xPHWfXQZNKtdGwcBarRkiirTHeETakta/K6t+FOyGcJxxpj8lvSk/rye1nqeaUpcBqiJYDwKSFKgTpI/6RUBJZWlphpusGPgtznNe7VUZdcU7gDCTQ/74=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1734958056; bh=dDEOkEShXEfEmvpjlGUVgRcqiNH2fOYg/o+x9diGIcX=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=M2ItTfYCvhWZYsmyl/i5ploS5yDUdpQgK+F65RWpycORYFgoJGGQRe1nGLB/pxSp2FiHlwGbLOFkALSZ0j6DTMo/GYuOLKSX/YDQaU981shddsF8baCszoszwgjlW8P+WVsctcs79O3uDu7XnTGh95/LXyJcwR0A2J4sUvzbXntI7S93mENCF3A98155kyi3UGE74vSXo/YXz8wjDt0olmkzISs/lURoBmSz5TonbiGjL3BdgRIg28gJjIZmpCuZY53wFvubPwXXe8Qrwo6ahAmlwuL/A4plIeNo8XvZeYHuuCeTE7l8mDmVmK6zGZZW7Z2txM8KMujwZ5uV4g73gA==
X-YMail-OSG: Kk1snv0VM1l1ZiK78bceom9jVgeE_.tHEUJacJ1uSVbQPfUEdKmOYFrSDtRJVbJ
 4byu74v2nXnOLPU7Yf94bcIuJXy8FlB7nTgAL8owCTzJfCnT62DOXPwDk3WIgrAANs5Oh9ghu0_3
 ZHWQb8xAcLsqWb.dvlDMDxtKokOXxyGtW0.u.7jbFHZFx_HFgPIqQJXIda9Af9SZy176h_TpNUk1
 4BHcqeCuGI4eG3MCke.uUz1aw_gSoEoaqxBFO5ko6sm61IQUXDxrrob784UgtRifXMsUMOuvgm5S
 iVUoRE7U0eaoaCxkV_88dMpl.Z9a2srmzr5UC4NwkcdwCn4nFKZtRZetl4N9ov8x_jgJNaytwd_N
 qfGHMhPK2TG2fTp1p2GQ37pe_gUpwM23FZO73jxAjcgbeVhIeD8slCH6afniqIWV2jSjIa.QovPb
 XdzbzhWQx_CPiX3C.AvnevyTLlCpVS1pBfJfanVJQTl9UjyxovJebEmCX0If4ohbKy010IronD__
 t9tC9A0cr8eTWGdxxyOiqgxqB55MVsYvDbC4mwDO9lpWwKgJoYtuIOseaR5v2bNrFzj.BH8tDqkd
 x76Rrllym55v2dxE7evWV.8Zx.DsYPVZ3w.TT.OgOVKDTp3Be6uPgzJgWJHW.B9eAziw7O8W97Ya
 Sy8N2ypUc.Z9OPcxoKhVTLS4KNWLpXznEaAPBIXZF6x12kfiKYPs4fTaRbti0zS7Y83qljMLsnwt
 Y_ItdQUKMDvOHlpN_PGP6EH8cwHraZUlKjDYNweEpMtYUrC4DI5nMPEdLOcLDf2JmhELA3Ey0paW
 EleBWS9d.1STKai3bb.IBoVPks32I6Vzb6i76XiqEfqYXG7xmN2PYc.WtqmTc6z.t8swsEY.qMWM
 C9pAwrYgbN7ZL1Avp8OTxolmVjnbs5RK6Ovd5aV8so96BFxiVxoLqnXWAiZ7p.sp5QUEXsBjwqFz
 E8ZMYxDpkNBJUp309XdbXWawg2yHuMOqMhl9T8.FJNtcbSvyyFYt2zlv.5IBOxiM5rSip2rtRJzE
 rnJAWkWg8IMuIv7RsWfgTweN71h7_SmSh.unFvRQqqnU1IOEqIgPvaL0v3olWJVMX287Jgn4tcg.
 kXD.opRTM6BG_ZQELxEFUdyVA.fkPaQe18AzRGU_OJY5sJN5x9R_dXeZXwb03_XgJt4z0NylAdvy
 yXK5XCEkwZSlXCjQ0oOe6WO4.E8t3ZS1hc.rJD7ejZvju8.gYVks0ICgJBww_tCTqaOZy.a4KKcz
 9w6ZrwbJxtsVblF8mlxMKjyB0IYT9vTD4neM735RUtjQ.9KuBDeFeUr7bTc6IOZFiY8io0spfPRw
 qkNEfAiTe6qHgmG6s8ID6n8gA9LNUJdcrJd8A72pl_hdYcFcgVnkhNyVRJlxwMEODjRjWeBaL8L9
 u7oCqreAGsngk6xZRmjXnjV6Ix1tphMq6KQdmrQ_EP7ZntD6fyZXqi5.T2h_hv4oSV9g9UABWZ8v
 VQAVZDmikO6L34K7gBI8upLlKpmji.5znP1FApygZg5N4BfohARQ.zn35JU_hl0HPrV.B9DQi_pu
 VrjZtsxwzaxPjkjoLG6pM9_rrlOp2kfeBMPzYZUU38Nbwr8hRlSy7x7vddpbV9m24ORTmKt2vVS4
 nD3u8Xdp5UGBNatizuvK3UWk3J.N5k1Unuls01kxBg.hp1jZ1peW6Y4nr5ksF9J2MNzwwLrNMTgJ
 z8yez0k.rsixAtTYFGt7qw9b0VWoaSDZIp5lrVWlsj5NMASiuWi.Y2T.TmW.t9DOUYDqUyrq6Lyz
 yKGrtwFypEGjNV6hyfEeRRDHbM6mTi8YPxvv6pY1UkxsFR83_IqslbEff6R0mnIAN12uMDn5vcTe
 t8QT841MhD.Le1OwGOh8P3H47PggloDSv7J6KLxM.ghpUuR2x9HtVxzbUDIjeIn0KulM60e2.ImY
 6D4CkBUPqJAIdgo2j1P6rjdxr0t51OaV4__oZYoOzmsDVnQiPg0S8njUCnjlBhYeWhsozTmhDGeF
 .E2I4KbvacTQzoyWp57u7wRevL62Zs2KwOMhhVjnal_2xU3t163PC8iT8RdDpPLARtqly.KsNV79
 n60kYXPdK5nicZ_Baw688ajTOjEVCJ4Bon5lYLYx3qcXkAsD1uvbIRjToE722hmA.Z1kGFYfhCmx
 pvZ0sRxIqZkUqI63KheZ0tDU1NLSVt8zGCSUwEkeOeu5Kbdkc_nqyybIk.Ahw_mWVOn0lmxsnS18
 _3f0FVvnE.1FMiCpI0eh0FLwwmkaLcemCDUEN3fV.v20uvGjWUoyZDA--
X-Sonic-MF: <sbalfour@att.net>
X-Sonic-ID: 5b3daf9c-0f5a-407d-b0c5-b0bd47523822
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Mon, 23 Dec 2024 12:47:36 +0000
Received: by hermes--production-gq1-5dd4b47f46-pfhh2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 11a90cf96476689e6c76d174b1c14a73;
          Mon, 23 Dec 2024 12:47:35 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Stuart Balfour <sbalfour@att.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Hotkeys disabled on Asus H7606 platform in hardware on bootup
Date: Mon, 23 Dec 2024 04:47:23 -0800
Message-Id: <75B5E2F7-AA33-46BC-B54A-892763CA2311@att.net>
References: <D215090D-C185-4AAA-8BB7-31566F6D9C82@att.net>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <D215090D-C185-4AAA-8BB7-31566F6D9C82@att.net>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (20H350)

I believe the patch you are referring to was related to Asus throttle therma=
l policy in module asus-wmi. That problem is unrelated to this one. Kernel 6=
.12.6 (latest stable as of 12/23/24) does not solve this problem.

> On Dec 22, 2024, at 5:37 PM, Stuart Balfour <sbalfour@att.net> wrote:
>=20
> =EF=BB=BFI am on kernel 6.12.1, though I downloaded asus-wmi.c  from top o=
f tree at git. If you are referring to the patch in Sept. 2024 re OOBE near t=
he bottom of asus_wmi_led_init, yes I rebuilt and tested the driver on the A=
sus H7606 platform, and it did not enable the backlight. That=E2=80=99s a re=
lated problem. Can you provide a URL to the patch submittal you refer to? Sp=
ecifics really help here.=20
> Thanks.=20
>=20
>> On Dec 22, 2024, at 1:20 PM, Armin Wolf <W_Armin@gmx.de> wrote:
>>=20
>> =EF=BB=BFAm 20.12.24 um 20:28 schrieb Stuart Balfour:
>>=20
>>> I have an Asus Proart P16 model H7606WV Ryzen laptop. On Mint 22, kernel=
 6.12.1 (but later kernels are similarly afflicted), on bootup the hotkey fu=
nctions of keys F1-F12 are inaccessible. Evtest for event7 (hotkeys) shows n=
o events generated for key press and release F1-F12. Fnlock toggle Fn+ESC is=
 inoperative. Fn+Fxx is similarly inoperative. The problem is that the hotke=
ys are disabled in the hardware. They work on Windows 11 24H2. The relevant d=
rivers there are contained in the Asus proprietary crapware. If you don=E2=80=
=99t install the crapware, or uninstall it, you may not have working hotkeys=
. On Linux, an undefined (asus-wmi.h) ACPI device id is associated with hotk=
eys and that device is undetectible to the software - querying it returns a p=
resence bit of =E2=80=9C0=E2=80=9D.  It does in fact exist - it took me week=
s to find it in the DSDT. Even experts could stump their toes on this one. T=
he putative device id is 0x100013. Asus released this platform mid-Aug. 2024=
. It=E2=80=99s likely other newer platforms are similarly afflicted.
>>>=20
>>> I=E2=80=99m close to a patch in asus-wmi.c, adjacent to the recent patch=
 for toggling the OOBE device during driver initialization. But the device t=
his time cannot be detected. A =E2=80=9Csecret=E2=80=9D device. I think this=
 fix is going to require a change to the ACPI. Poking an unknown device is a=
 recipe for unpredictable effects. First I need to get this reported as a bu=
g. Where would that be? Then how do we fix something that actually requires a=
 custom platform-specific ACPI?
>>>=20
>>> Thanks for your attention. It=E2=80=99s been a long haul to get here.
>>=20
>> Hi,
>>=20
>> the latest 6.12 stable kernel contains an important fix for asus-wmi. Did=
 you test it?
>>=20
>> Thanks,
>> Armin Wolf
>>=20

