Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F71F37C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471848; cv=none; b=nlAM97JQ0PIFrUq8BSlX05q2TqtIcSMo/2gWLJivBZcn723pVFFwFoK72Cat4uM7qklA7rLFhRRHH/nNpLmv68j+GvCTSJpnML8VEyp3xgd1xQXTsP1FSQURDgt/pXbW+jwTfvUjXiA6ZyPgXUUxWErMs7C02WY0yb1I/M4ta1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471848; c=relaxed/simple;
	bh=kYqkuidfCjuPa/X0Ka1XFzCLDGJOjEHODmCIKvLZ61M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6TJaqRAu5CShQTSb1+ik6ODyGMnUFxCnueDUTd6z3+4AWLo35bLs4t1V1RrOAU787C2Xn2Cs9EjF8kzJf+R9pOUYjh7r4mBKAvInKq6VYgIdpRwnv71iaBx/mymL/yqzOj6aJ9CoX5IHqc682IRsvb0Vt8JyML/AYP2KlwUOpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=c1PG65Xs; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="c1PG65Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734471843; x=1735076643; i=w_armin@gmx.de;
	bh=kJq6apBwvyVOVZD2n3lJi3M0sd4Q0Cu+JuM40mhEppU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=c1PG65Xscwa3yIahtgj4UiPWW10pEe4+XlJzKXRiTEd8v93MrCXJvx7BIilLIRbC
	 WNkVmyK8kCpzMyf6eaLZ6xHq46qMHQC0A0DMyewi/Z6qrSqHg/s8yZubE0o6Rou4g
	 qull1m6dHOPDlQJZq7XdPTxt14WFIk0lO79k5yA3Fm1SQkTKnz5hpYY3F9JwcMG2n
	 HSdEu+7RkvOA1I6sbruqGvcFxeMEzKBPmibwAoWI9Xt1YPO+RmYxZqFdZipBzr+Mz
	 9PAimIT741jLV1Ub0oULvhlRQq//YBVtCBzToyfnSFgLo7tikIJZ5C/3vOqERN6+Y
	 JAeahvc81BF3oabpdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1t7Nh60cuV-00SnJl; Tue, 17
 Dec 2024 22:44:03 +0100
Message-ID: <c5124fb9-74af-4c90-9edc-ddb3517cd9ac@gmx.de>
Date: Tue, 17 Dec 2024 22:44:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8U7Kq5SMCr/1nAXYofqi8hEV0QdEptpC/6IO/H0q2PctWhGUKDd
 1Fz5WKVhkfjH+soekhtaOL1YOY4GsudBCqolBXoGFjYAdEhctUZqgZlYsI1d5ECFTHuGw7C
 jBqHDyOVi1Cbf/chQJRjJVs3lwKSJ6NYXOdgiWWZ+lnNbi8KZ7Vb79/zop5dgfWwVZPbh00
 6qtxSdKNpOxwKk/7sI6/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:119P7uwmpdQ=;X0k+Zhj1epi972qwF9EBdpFxbeC
 COnejSJoXnsB0QLXY6WO83Bjh2O8TQWwnTEvUx1PnZ8E9N4Y6cp//y473PXy7NXx+S85wz4/g
 GyKMvCwNsMMi1GXkAr5M0/uQTmvPRJ2LbB9uDVw4NquWEvYbh0sufc/tlM1UqAEN+66LOQhvY
 bRYn6wbsvfb2M/l5sr2uV/6IOGx5CKTSA6LWuN4eBL8t6gVyZjTgoMc8K9Exa+7y3TmyvT2nx
 JhTAgOhCNfdnh0WdVgg8vSERsUQ8JiMl6vg1DMkSOzZazGKdXLqiEZ5QIUWT9ztoMKM0kRQnt
 aLX02yWoOOnjQofeh+wYl3k8meAFSewAahO8LDKbQRX1DeTmi96/XUZwTD21KOmx6ImHSLdOl
 w8A5EYKiwbILimGTTfJLfKdMh9P347hbY+PbgDei78u/mAw+oc0BXkFjRI3DG1Sq0lOamjnGt
 deuIOHsSI4ZQWpTdvGJHc4KlNhvt4HIvmUTVU/Ly4QzrOREV4/Q06i2OqaH5V5vZGBNngcf7b
 sUXN80/xlJS8rYEwVi12KbrsnT1z+OF+HhV4lRAaDzGRdGICyDbkfbQ7GD0XtqCYBGeuPqu7v
 HyIDXneSzGoGjcvyS21/y76s18/mHFYnCpkvopDiw8ykPV4Wm5L7xEqE+ZDZ8FgyJtpCfuj3X
 dw15ssMMRZ5ncD0wCLePXVWCsPiOscLsPE7Xc1ms2zuz43oY/0KVAtNumHSGVSpgjt8f9cIOF
 r4zCurPAGYtZoJLCK0es4IqR/PRcRhrtUQVqbknncbGKGbBGupo0xLPkEMtSTg76qaOn5+wNz
 YxNlr81ezTFgSLh3MtjBzfuwH4PYf/TU7vAlcsMpIewIuuJlvnU3DXJHC4H8zCqcoAXpNbYlK
 RU9aHRsrAvhmNV2TPQodCRxhXymBXn7xK7WfrDgdvtEZPFF1OBXcbZcL85zZhX/oILcPe6ynr
 gwxXK5s851NabCQhUtAnL+PWrm5LCStKvpgmXFFh/uWwWIcAgmgTGXPzImXtYosO7saBIw0EN
 2RVt5z14+8LkzLzGxb4s82yEJskDaG+ed6aPXCZ1BDsyLflGnkbEC30ACiRZcO1UEsAzBlsmH
 K3FySCUSQkug/M7bDHpPfeU7bAdRSQ

Am 17.12.24 um 21:52 schrieb Hridesh MG:

> On Wed, Dec 18, 2024 at 1:42=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>>> I'm guessing this means that I will have to learn ACPI and how linux
>>> implements it if i wish to debug this issue.
>> Actually i think you need to look into the Windows application and chec=
k if they call a
>> WMI method during initialization to enable this event. On the Linux sid=
e this event should
>> be supported if received.
> That makes sense, I will try this out soon.
>
>> Then i suggest you install thermald so that the platform profile fully =
works.
> Wow, that actually fixed it! Throttles just like windows now, thanks a l=
ot!
>
>> Also can you tell me what special OC calls are necessary on your machin=
e? I know of another user
>> which might suffer from the same problem.
> Yep, there's only one call - SetGamingMiscSetting (Method ID: 21)
>
> Inputs:
> Performance - 0x40B (OC)
> Default - 0x10B
> Quiet -  0xB (Nvidia Whisper)

Are the other OC WMI calls still submitted by the Windows application?

Thanks,
Armin Wolf

