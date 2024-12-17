Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8071F4721
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442119; cv=none; b=jXD36m1OvGTZR+U5D5WPGjqwXgp5fi+QJYIeromocotdcYqBFQ0w3avpFCcPkZScD/0lctvUOvUD47Ug4j75fOyT5tSdoLm16S8Stwslof+ZMFS6I7grzHjZFLGwlebisBMg0czkAIQGlFSHKFEFH95Bn4dCmdT0ejNfkV631jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442119; c=relaxed/simple;
	bh=QBVS9kaz2bvVoUhqZtCelKs3eFPHXn75MNDU/Da3UCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9HADXuPGEBSvDyIN2QIR61/et9NZQAiDPiRsnS+7YAJTYKeVEEc0N4go1Z+mx9LBhFXXdeWcs2JT6e97vAqw3gKvq9jOSeBF98Z9Cs79XEspoy9yTWU0U7P6u+j2PYf8ZrxLpPsxU08N1Q2eZsRvNkre/NADZtvZz/VBAx+r04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MPuxjOoq; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MPuxjOoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734442114; x=1735046914; i=w_armin@gmx.de;
	bh=QBVS9kaz2bvVoUhqZtCelKs3eFPHXn75MNDU/Da3UCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MPuxjOoqk8ZNT1vkISodDxB8hBX2H26FExpfTYvqZzL7BBJh60iQ2B+7LTn5hXBu
	 dyOU3vVnqwjeNai5FpS8NvPH/eD4WjlgBygyMm0k7A1Odnq412KoLNHIeS6h+Q/r9
	 1xp/s27DCd5iW+CGprW4TMx8qwt2DxfKsiTXVZU8W6H2vzf+V581SBhxbk8S/2Wjt
	 NJLs3txNmJ90+9QJM+5d+Rq71L/5Ckw6XCcas5PZgQZ6Gi4YJFEeo8zi/30g8C5rk
	 M4PWEJvH4EY8y4EKF9ayfNkGd1MSNGO3zCkeIORhD4esKL9hSfm1pcsF9YTrIt75V
	 L2Vwfp7Cp7ScflyjOQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.3.38] ([141.76.176.50]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1tBLtt3Aoe-00Y1Wi; Tue, 17
 Dec 2024 14:28:34 +0100
Message-ID: <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
Date: Tue, 17 Dec 2024 14:28:32 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eoAy6IGTQJymEPBpTJBxqAU8mqkdGOfXrSSKKGcnv1AxxXbgUc6
 4OSXXrY+dwjMeh5qMuvQ+tt5e96MiGHiKlJISrHrVmnMasrpihylPWQ+OItaailvxcPLIjq
 +aw58rxL9T6ZO8+OFPmExuwlpu97wEjo8J97yh69sQZN5ZBpu3WaDiJhCBIowKd/anEYcmC
 aQ93jn0DsqmB1/6BfuGTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2ge6SlZ06f4=;15OEZeJZpCY9S1goYXsg4aDmoIh
 kAxEBT+5Rek75Qc2OncQTzkdJyphWHuLY6DbHsU0MIr9DbKTFu4fUP8fqlWvLYTZU/VGuDRnb
 XktqetweZOZI/nZAE9Nx5IUjMqLqvHn0qcTYZ8EkuXUPNqVc5L97gN1Gh9lczUPyEbYjwTWCi
 nBD1tWqis8oLwaF6pgLl4nt1gZMKX6ktuxeD5GF6h5X3tDJhlRgObQmbcj5XZKXJowMX+/ihB
 jCH3IvYZhv8tfjRykNObwe1dTg7t1D5Butx6LHMBMp4vE0iNtchKEUHI+nMu7H51A9CixZfkV
 J6mPF0eKWaj2wgVBD39zuvnL5c40uS+XC5ft8+9l4vJJJRnHM4ZIPj2fWUGLadT62RslMk7ur
 eMaFsbb8/1led2gHCKwhWAP+JbVuUtpqugU156pR7ZaA9W1GItA6i/3ccGpIAOGoXX9UYhYDi
 jlUI4y35Uvw8T4zNfkQCtolMyNfkf5BZjfgk3sVJgRM07NAt0FofaESx+h9QBkM8FIJ6lE0r6
 WcWxmfxySgm/6kVwDJC5LvOy7Y1fbLE4fNkanOVQOlicJAJbA41NS8YnkmKJr3QXd117ZKeGe
 RtFYjB5x5tCDZ/MNe/RyohTjCqUdvRVxWqfhZunwl+R0kcXE0GwLbWjul6F6qr0L+VSLG4m6P
 /6LXTgFT907xk6HB+DsqsL9cTOKaIE7W4NitzqlKB3CYNrlcc+idle9c34jXZAZIckB1lLxZ+
 2UnErxdAm6AnoBF0w3iGc/E8cPd+LtmWqWPl0p6H9Ruof8kMRf7s5/0rvxtdEipewFwDh6pZO
 +EFOVLWzFky+GurdPDF4zMOQA9CowUchZirFiZpL4G2yoKTVuJzeQZKr3JEkjPSTEJFPS+LIx
 jo+K4IH70LIVRcKy56Z5deh8X5RPxsBSR7c5dvJnqfOlTLwapVDPJURbgPi6AatSHZMjB/63A
 gakHzhjzgJjCK8626z+1Vb6w/7npd4BOOSLQOx0MaBVr2AEIr5AfaARbDu7VQhMR3JZRtfwFo
 QwKF+zxSWbvWFhimplRhAgvkjtJYLB/m7mjVfybpy1XIdEu524AGE/6WG7bJLXew//DZY1x8P
 YuwNh9PAFkAj9jtovqNDhMlc9YCOBb

Am 17.12.24 um 09:33 schrieb Hridesh MG:

> On Tue, Dec 17, 2024 at 6:17=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Theoretically you can use a i8042 filter to filter out those special
>> keyboard events. However i suspect that Acer will not omit such an WMI
>> event without a good reason. Can you share the output of "acpidump"?
>> Thanks, Armin Wolf
> I've attached the dump. Not sure if it means anything but when i ran
> the command i also got this error:
> Table signature (0x4F324824) is invalid
> Could not get ACPI table at index 29, AE_BAD_HEADER

This seems to be caused by an oddly named ACPI table ("$H20"). I will ask =
the
ACPICA guys if this check can be relaxed. Other than that this error is ha=
rmless.

It also seems that the ACPI code contains the necessary logic to submit an=
 turbo mode
WMI event. I suspect that some settings have to be enabled first.

> I also noticed some difference in the turbo behaviour on linux and
> windows. On windows, making the WMI call increases my fan speed and
> raises my CPU's throttling temperature to 100 C. The same increase in
> fan speeds is observed in linux but the CPU's throttling temperature
> is not affected. I don't have any thermal management daemons running
> and the CPU scaling driver is intel_pstate, do you have any idea what
> could be causing this difference?

The thermal control should be handled by thermald.

Thanks,
Armin Wolf

> Thanks for looking into this!
>
> Best regards,
> Hridesh MG
