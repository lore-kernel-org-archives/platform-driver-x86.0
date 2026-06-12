Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66618340401;
	Fri, 12 Jun 2026 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286727; cv=none; b=BFWIiP1OSp6TGzYW3xht6no/a4R5kltaSambTRBWfj70505xn9ZCPrZ1H0H448+WIAy88iR7eIGikYuSc0+Q1+pZr6WKkZVi4JvRBnvTytcfnSMJ8zeE3MyE7iESoL/DrSl6snge2F8nzrT3aM+Ag5vMvD6PgBDXdnEBx0jO7NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286727; c=relaxed/simple;
	bh=votY84VPBmuR7tE/gSxw3Kberq7A5okmxseZSy8c6Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEbETzvx1V1o6KYfI1ymU4OLn+rGdMEFsfXTcFA8xCgM4kG4MvU3pJZ0ikgJ9hZgekTaVhfBt/J1sYtpI3nsDOgOswp/KxwYkyxTGeSRKwJ7rOlkVgsYQ+DjGmQ4A4mVclicSoEq2CL/EqLWq4d82MWVZ4tWlE+Oq4A2qHrq6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=L7yJwjR4; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="L7yJwjR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781286721; x=1781891521; i=w_armin@gmx.de;
	bh=h05ZBWEWydD3rrbLxsDFqO/Xpeq4MxT0iRi3jxKSdy8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L7yJwjR4wTktKsNNQc2JzmICQqDHOTZMPFl5gGGwHCEqYOOhrE3RDel5/2KBiQmh
	 /9Anif9t1mpygUx0JjOySlZd+o3ajBsxAQHL4sqju7aZpRf5CuUZvniPXW1HkK2AU
	 ZMhH7nAmVT0jfro9oLQq9Gdo+R/d7qC5ftgu4wFYQQ4mLtRAYsyvUNq1esVU/pP4v
	 224t6na28ZdtFSEWIIG8EozSSEEUaaQEGLXQ6PhDOmQ9AtDxP4+kE8A2aJJcAN67G
	 N5RA0LxNgCGv2+MI0KoD3da2ATR/yHBGJrW9m38aIgFeBnsQAVxgX8DXMVJ5oH8AV
	 98+TzhOys8r7AD8YNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1wd3rf1b2A-008TMM; Fri, 12
 Jun 2026 19:52:01 +0200
Message-ID: <aac89456-de78-4177-b10b-eb5606a5b7c3@gmx.de>
Date: Fri, 12 Jun 2026 19:52:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: msi-wmi: Fix unknown wmi event messages
 on MSI Claw models
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Renninger <trenn@suse.de>
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
 <3d4b27d4-0c31-46d9-92bc-6c584bfdfbec@gmx.de>
 <CAFqHKT=QpdDF30WGpA2nV57p_BL+s7fBvRa-_hXebt390n1jdg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKT=QpdDF30WGpA2nV57p_BL+s7fBvRa-_hXebt390n1jdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AzymxCn5LF1SmV2epDISd6ArmykgqBsaM5O2b6N3HSq4OL+P0Ie
 4Hv7+m9Z1QIKjOrUeGrF5iIS1KImGUE0U2FyJrEuZ50Glt0mCbmX60OhStbodRLDvrhvN0+
 duiXa5vszvKzfATUCjB+bOWlBj/2/DJN+7kXciCzczVtyuZUScU7WBxGgFZoqxcWp7Eawdh
 P3tsUkBmq9XLQLMMcZxZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gTeSgVxnlpY=;LdBzkG/HCjMw37gZvvrlhtRHskP
 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
 A79Niw==

Am 12.06.26 um 19:18 schrieb Derek John Clark:

> On Fri, Jun 12, 2026 at 9:34=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 12.06.26 um 00:39 schrieb Derek J. Clark:
>>
>>> MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID f=
or
>>> some of their buttons. When pressed, these cause spam in the kernel. T=
he
>>> Claws use a GUID already supported by msi-wmi, but use an
>>> ACPI_TYPE_BUFFER instead of an ACPI_TYPE_INTEGER.
>>>
>>> Patch 1 reformats msi_wmi_notify() to reduce nesting by using early
>>> returns and a switch case in preparation for handling this new data
>>> type.
>>>
>>> Patch 2 adds known MSI Claw event keycodes to the keymap and support f=
or
>>> ACPI_TYPE_BUFFER.
>> Would it be possible to turn this driver into a proper WMI driver using
>> .notify_new()? This would solve the whole ACPI type problem.
>>
> Hi Armin,
>
> That would open up a huge can of worms that I'm not really able to
> manage right now. This driver seems to predate even the older wmi_dev
> standards (copyright is 2009) and I don't have any devices with the
> legacy interfaces.There are 3 standalone interfaces, the original WMI
> BIOS GUID, the backlight GUID, and the Wind GUID. The Claws only use
> the Wind GUID, but don't implement most of the buttons that were
> already in the driver, so I would be worried about regressions with
> the older interfaces. The driver is simple enough that I think we
> could get away with just one "modern" driver vice doing one for each
> GUID, but I'd also need to refactor everything to use drvdata instead
> of global vars so it could be instantiated multiple times. All of that
> seems like a lot of risk and effort to do what is effectively adding
> an event for 1 button on the A8 and silence some warnings for the rest
> of the line.
>
> I just now realized I forgot to include the original author in this
> patch so I've added then to CC here (my apologies Thomas). If there is
> a v2 needed I'll include them going forward.
>
> Thanks,
> Derek

No problem, i will see if i can get a MSI notebook somewhere to do
this in the future.

Thanks,
Armin Wolf

>
>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>
>>> Derek J. Clark (2):
>>>     platform/x86: msi-wmi: Reformat msi_wmi_notify()
>>>     platform/x86: msi-wmi: Add MSI Claw M-Center keys
>>>
>>>    drivers/platform/x86/msi-wmi.c | 92 ++++++++++++++++++++++---------=
=2D--
>>>    1 file changed, 60 insertions(+), 32 deletions(-)
>>>
