From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] acer-wmi: only supports AMW0_GUID1 on acer family
Date: Mon, 29 Aug 2016 12:11:59 +0200
Message-ID: <87fupnx4sw.fsf@miraculix.mork.no>
References: <1472464553-9922-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:46599 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756136AbcH2KPv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2016 06:15:51 -0400
In-Reply-To: <1472464553-9922-1-git-send-email-jlee@suse.com> (Chun-Yi Lee's
        message of "Mon, 29 Aug 2016 17:55:53 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>

"Lee, Chun-Yi" <joeyli.kernel@gmail.com> writes:

> The AMW0_GUID1 wmi is not only found on Acer family but also other
> machines like Lenovo, Fujitsu and Medion. In the past days, acer-wmi
> driver handled those non-Acer machines by quirks list.
>
> But actually acer-wmi driver was loaded on any machines that have
> AMW0_GUID1. This behavior is strange because those machines should
> be supported by appropriate wmi drivers. e.g. fujitsu-laptop,
> ideapad-laptop.
>
> So, This patch adds the logic to check the machine that has AMW0_GUID1
> should be in Acer/Packard Bell/Gateway white list. But, it still keeps
> the quirk list of those supported non-acer machines for backward
> compatible.

Works fine for me on a Lenovo Thinkpad X1 Carbon 4th gen.  Thanks.

Bogus accelerometer device without patch:

  acer_wmi: Acer Laptop ACPI-WMI Extras
  input: Acer BMA150 accelerometer as /devices/virtual/input/input16

With patch:

  acer_wmi: Acer Laptop ACPI-WMI Extras
  acer_wmi: Unsupported machine has AMW0_GUID1, unable to load


So if you want it:

Tested-by: Bj=C3=B8rn Mork <bjorn@mork.no>
