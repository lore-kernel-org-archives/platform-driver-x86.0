Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A484679F0
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jul 2024 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721787575; cv=none; b=lTEaBFex5UdxbGnxWC7hdUuHFl7FNCxUy4iYeEa0PSBYtPK+9SVm9Uvh+BL5gtK5k6C1DwPTuI88WbHWkkBjNZvQITXLG8GDShkta9LNwAk6cY9q1FCcXQE07fRVlnuHNcGnGI1jkmOORvYk4wgE++wSY3R61pJM2GAwJ1tQ13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721787575; c=relaxed/simple;
	bh=FbjvGV1wPyjP7WoerIqGY8rumQG3E3Ig+1LQAMFFmMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWRFxKqHNt1LRCDgqnVmjFR199KVfOXf8+/yPILXzKxoSnKFNsDxevFlNIiB1G4Q4ur1olJdXGYkkLSz9MEMMnyVlnkF/YkscQv2CX8D/YHEpVYnA/DWIMYLRqFZJGKFfb/PWIx1Rq7oTEjkK0ztlgAgew2KramzCxsWohk99LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=O5Hu/T1g; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="O5Hu/T1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1721787555; x=1722392355; i=w_armin@gmx.de;
	bh=zMLWiqR5b/W6JW74c3sYtB2O5VjPaG3OH0VY+8gPNLM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=O5Hu/T1gsv2009ae19yErwbP4S6S0S+L/cBjSHRdRUI48pTmqVshicHnotDV2Bds
	 SzgsfKFzPuBd2Mm4e5QI6G1pU1N+eGpeRZFkdtj7gKax9Ua7BZQLlNikuIsvBD8aN
	 wrcBEOwJ1/A7jwKDWxP0OFKJ/2QqY6S/u0FO3JPqtl84xXKLZ/np24K9wYrR0M9Qn
	 o4BcmTk6SJXfyTfN8qTpzgZgSO39XbTnXNJhhVyQT/g7WnXwVHxQAC9yEW7KWFKW8
	 WwHS4oUi4RqNTi20QEZNg1vAmBE1zBMRd0xTZi3vRsHuCzx32PvaJibkLvbSw1reG
	 4H9hzJdJspa442XDaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHru-1sHfrt1z3a-0129PJ; Wed, 24
 Jul 2024 04:19:15 +0200
Message-ID: <1f3435c3-6006-4f6c-8e8d-d6e0ef23e42e@gmx.de>
Date: Wed, 24 Jul 2024 04:19:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Tablet mode on L13 Yoga Gen 3
To: Liam Howlett <howlett@gmail.com>, hmh@hmh.eng.br, hdegoede@redhat.com,
 ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
References: <CAHfPaQt_ZkJ=LghsuNg98X+HmXcbDbPvT2QyB9sDQLX5+KkU4Q@mail.gmail.com>
 <CAHfPaQuLT1zvuRBQ9bJZ7=rxLrOXbZ9xryoGH8piWa3r5cfSPQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAHfPaQuLT1zvuRBQ9bJZ7=rxLrOXbZ9xryoGH8piWa3r5cfSPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AowwfZ5AX2iG+MaKvcpLs9icv4W9Y5zrx220nLcpX+Emq6CNP+i
 GTCYsUad9UOomP9nJYL6CWkiOxbxsnwfsfirhGF0TUhpykLbu8FnyJxe1inQP+E0xvf3hgs
 8vJzVtVnaWREWxOXvoRMdTLBjYn0iNNyLcPDJuhF7uLn3hfLBiPLt1WbiFnxb+5NP8NvU3F
 jnL/kgMP/u0xZYhVP62bQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2GpbqQE38OY=;i5kwQvmYfYUvJIANpkZ5sTildhO
 EDeUz4QMLfr7e6QUx3sk77AhnDluc1ktkyTL3oJtC3f0k+DdUTjywGPcugh/dmuHryi5xDeQy
 8u3OrpKcmtG4tcQ3ZdLPCKKpI9WRtoDhss1RBvFkMF3PrRcu/mv7Ar8CtNUTqrA2eHTr3BI+w
 gSM3aO7EJs4RBc5sQZAESx0P3ssUfhUN35jsz8rkzDThjXu0dVSVExTqoYEQPZ5Dct6SPUl5O
 GeSbTzQ/qW2G6jzyq0wJzZibzUB+7NzyD02//aitXb61LhtpR/HfbuaspJvmFe7Fj+5CrSj/a
 fzaQu2bPDjxxv9NU7tdgD57WueDWHBB1Uh27AffyXAEg6Gq50VqPT3msATCqLfhK3K3JHVS39
 19a/zT4JOs8yuzLOT7qlCwq1BVaqGVqs4/BHomGoIB0RQTKuQZy+IYe2KPk3jtwNI9qDoXF7F
 RJErHXkJ0KDb0p5g7dakXYFe/9eAlGf/uZ5Y3SZBSiLp/2Vnlh+p8DgYs/FJDGe+8+6HdutTm
 3V+FfzZq0r5qtODF39iGlpVcRVE4bKZfMivELB7JZgWHXUs5vPqmNfX2Cj2aV5NktRjLKbywE
 OxJ8LksjmoX2PUkeCbnibu0Th57P58lvzs6jddDsg/S8psDCKG4x1nH5kYhI3u8r2TsVdBMmt
 X26NRUcnK1dO9/RSFEGa6TV9kLBLHESB+CFHZ6j4j5s2woOlcxYKGgAQETbI/Mm3A8y+5zsZ4
 9Xa4/Nuy7I2R6ht5K6ZxaFR7vLSVODzqp+QobumdP/RT/SKT8kG8tIYqTawkS/HmC2i0w335M
 /3wldupDWdrzv2bXDUnjAlJw==

Am 24.07.24 um 01:35 schrieb Liam Howlett:

> Just to follow this up, it's not (just?) an acpi issue, the driver
> isn't doing what it needs to do - if there is a driver for the
> hardware at all.  I'm still looking into what is necessary.
>
> I did write the value to the CMMD variable, but calling the _Q2E
> function does not cause the ^HKEY.MHKQ (0x60C0) to be sent.  If I
> understand this correctly, that's what should happen.
>
> Thanks,
> Liam
>
Hi,

can you share the output of "acpidump"? This will make it easier to figure
out what the ACPI code is doing.

Thanks,
Armin Wolf

(Also, please do not top-post, thank you).

> On Mon, Jul 22, 2024 at 11:30=E2=80=AFPM Liam Howlett <howlett@gmail.com=
> wrote:
>> ..resend in plaintext, apologies if this is the second copy you are rea=
ding.
>>
>> Hello,
>>
>> I'd like to say first, thanks for the support of thinkpads in linux.
>> As a kernel maintainer, I understand this is a lot of work and I
>> appreciate you doing a fine job with supporting the hardware.
>>
>> I am working on patching the thinkpad_acpi driver to support the
>> keyboard rotation and keyboard lock-out in tablet mode for the L13
>> Yoga Gen 3.  I believe it needs just one bit extra to get working and
>> I'm struggling to figure out how to do what I believe is necessary.
>>
>> It looks like _SB.PCI0.LPC0.EC0.CMMD needs an initial value of 0x01 to
>> 0x06, but I don't see a way to trigger this to happen.  Alternatively,
>> is there a way to write PMMD?
>>
>> Right now, I get the following message on boot:
>> thinkpad_acpi: Unknown/reserved multi mode value 0x0000 for type 4,
>> please report this to ibm-acpi-devel@lists.sourceforge.net
>>
>> It looks like the value of 0 indicates that the keyboard rotate
>> monitoring is disabled, but I cannot seem to find an ACPI table way of
>> modifying EC0's contents (or set CMMD/PMMD)
>>
>> The functions of interest seem to be as follows:
>>                      Method (_Q2E, 0, NotSerialized)  // _Qxx: EC
>> Query, xx=3D0x00-0xFF
>>                      {
>>                          Local0 =3D CMMD /* \_SB_.PCI0.LPC0.EC0_.CMMD *=
/
>>                          If (((Local0 !=3D 0x00) && (Local0 <=3D 0x06))=
)
>>                          {
>>                              If ((Local0 !=3D PMMD))
>>                              {
>>                                  PMMD =3D Local0
>>                                  ^HKEY.MHKQ (0x60C0)
>>                                  If ((PMMD >=3D 0x04))
>>                                  {
>>                                      WFIO (0x0B, 0x01)
>>                                  }
>>                                  ElseIf (CPLS)
>>                                  {
>>                                      WFIO (0x0B, 0x00)
>>                                  }
>>                                  Else
>>                                  {
>>                                      WFIO (0x0B, 0x01)
>>                                  }
>>                              }
>>                          }
>>
>>                          If (((Local0 =3D=3D 0x00) || (Local0 >=3D 0x07=
)))
>>                          {
>>                              Local1 =3D 0x01
>>                          }
>>                          ElseIf (((Local0 =3D=3D 0x02) || (Local0 =3D=
=3D
>> 0x03)))
>>                          {
>>                              Local1 =3D 0x02
>>                          }
>>                          Else
>>                          {
>>                              Local1 =3D 0x03
>>                          }
>>
>>                          If ((Local1 !=3D LVMD))
>>                          {
>>                              LVMD =3D Local1
>>                              Sleep (0x0A)
>>                              ^HKEY.MHKQ (0x60F0)
>>                          }
>>                      }
>> ... and ...
>>                          Method (GMMS, 1, NotSerialized)
>>                          {
>>                              Local0 =3D 0x00040000
>>                              Local1 =3D PMMD /* \PMMD */
>>                              If ((Local1 >=3D 0x06))
>>                              {
>>                                  Local0 |=3D 0x03
>>                              }
>>                              ElseIf ((Local1 >=3D 0x05))
>>                              {
>>                                  Local0 |=3D 0x05
>>                              }
>>                              ElseIf ((Local1 >=3D 0x04))
>>                              {
>>                                  Local0 |=3D 0x04
>>                              }
>>                              ElseIf ((Local1 >=3D 0x03))
>>                              {
>>                                  Local0 |=3D 0x02
>>                              }
>>                              ElseIf ((Local1 >=3D 0x01))
>>                              {
>>                                  Local0 |=3D 0x01
>>                              }
>>
>>                              Return (Local0)
>>                          }
>> ...
>> and this portion of the _WAK code:
>>          PMMD =3D \_SB.PCI0.LPC0.EC0.CMMD
>>          If ((PMMD >=3D 0x07))
>>          {
>>              PMMD =3D 0x00
>>          }
>>
>>          LVMD =3D \_SB.PCI0.LPC0.EC0.CMMD
>>          If (((LVMD =3D=3D 0x00) || (LVMD >=3D 0x07)))
>>          {
>>              LVMD =3D 0x01
>>          }
>>          ElseIf (((LVMD =3D=3D 0x02) || (LVMD =3D=3D 0x03)))
>>          {
>>              LVMD =3D 0x02
>>          }
>>          Else
>>          {
>>              LVMD =3D 0x03
>>          }
>>
>>  From this, and running acpiexec on the dumped tables, I can see that
>> the CMMD value is always 0.  I don't see another function that
>> modifies or touches CMMD or PMMD directly, so it seems that this value
>> is read but never written by the ACPI itself.  I also see that these
>> are the functions that your driver often uses and is trying to
>> interact with.  I tried to set the CMMD value in the acpiexec, but it
>> won't set RegionField:
>> - dump _SB.PCI0.LPC0.EC0.CMMD
>> Object 0x55c5a3389490: Namespace Node - Pathname: \_SB.PCI0.LPC0.EC0.CM=
MD
>>      0000: B0 D9 38 A3 C5 55 00 00 0F 11 00 00 43 4D 4D 44  // ..8..U..=
....CMMD
>>      0010: E0 3B 38 A3 C5 55 00 00 00 00 00 00 00 00 00 00  // .;8..U..=
........
>>      0020: 00 95 38 A3 C5 55 00 00 01 00 00 00 00 00 00 00  // ..8..U..=
........
>>                  Name : CMMD
>>                  Type : 11 [RegionField]
>>                 Flags : 0000
>>              Owner Id : 0001
>>           Object List : 0x55c5a338d9b0 RegionField (Type 11)
>>                Parent : 0x55c5a3383be0 [EC0_]
>>                 Child : (nil)
>>                  Peer : 0x55c5a3389500 [WFDK]
>>
>> Attached Object 0x55c5a338d9b0:
>>      0000: 00 00 00 00 00 00 00 00 0E 11 01 00 00 01 00 01  // ........=
........
>>      0010: 90 94 38 A3 C5 55 00 00 08 00 00 00 C1 00 00 00  // ..8..U..=
........
>>      0020: 00 00 00 00 00 00 00 00 10 3F 38 A3 C5 55 00 00  // ........=
.?8..U..
>>      0030: 00 00 00 00 00 00 00 00 80 00 00 00 00 00 00 00  // ........=
........
>>      0040: 00 00 00 00 00 00 00 00                          // ........
>>                  Type : 11 [RegionField]
>>       Reference Count : 0001
>>                 Flags : 00
>>           Object List : (nil) - No attached objects
>>           Field Flags : 01
>>     Access Byte Width : 01
>>            Bit Length : 00000008
>>      Field Bit Offset : 00
>>      Base Byte Offset : 000000C1
>>           Parent Node : 0x55c5a3389490 [CMMD]
>>          AccessLength : 00
>>         Region Object : 0x55c5a3383f10
>>        ResourceBuffer : (nil)
>>
>> I am nervous about adding a call to write that region field to the
>> thinkpad_acpi driver, but there does not appear to be another way to
>> modify the entry.  I've searched for CMMD and PMMD in the dsdt.dsl and
>> haven't found a way to modify them.
>>
>> Any help would be appreciated.
>>
>> Thanks,
>> Liam R. Howlett
