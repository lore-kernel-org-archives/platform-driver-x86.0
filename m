Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D3B129A9B
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706715760; cv=none; b=DhDw4wUNQDIQoyERNaQAuA5MmzWVDLEFvRcL8OFvdyrbtjL0nzde8eE77GNk6JqUkbgiT753qxx6mbVsL0LIsrMEq9FPJOhjBW82VMicpIKi0wGbUs7ymEdrSyYCNDQt5AAL0lUEk6L3euzhFuZK+h1L7PKD4Jt2xeozkfpGP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706715760; c=relaxed/simple;
	bh=1HWkIX/WNN0nwmBVE7bbtN83YdYtWDuZd8rDp9s8XAQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtDDoat5EFknpeZh74jpFR9MDrTUy285wpfNCqHY21uHMvUvz8BPLiqR0CY6QdoTNWoTINDxhtWPZ9766A7BtcLb4LTenpL1FCECmc/YJmqWhigsYHQYcAnvYM25g9Gc5WHc8b/tFg9PLP3k5PLaJEs3HouFoWP3AlDJe6/Wyx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ZL+FB3Yp; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ZL+FB3Yp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706716657; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=djCihWQxqC1iUjHvKJ555aIVajzT66JPxH/jtLqpNlo=; b=ZL+FB3Yp
	LKvtRUx6aXKbug1/BynFjfdHJTsKW0ycVNt+Nb5iyu2wtwIwKa4LbhUQBO6pXRzZtBGTa2c/eAe8z
	XAMMphnhFwHAw6veBkMws6e7d227AXBWRfyIT4qx6wDf+3BIp01U1vsjrnFiQvT1giRQ/b22xmMcM
	U5C97UoJoTExacSLsktzaUUKr7GDVaN/hLGjAR25t0/2UjBgoLrTO1pAEaz+YEJuq9ci6YmYKPUjS
	VQzQwbwENqXkqWFF7Yg49iPuoK6ZGVjsvuCgVFSBDMJv8nW5+ycMyCuzX1Eame/pvaEiDIqEe2hxz
	nQM6gYNUGmSLNvuWsb96s/8tfw==;
Received: from [10.143.42.182] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rVCjR-l1jfOp-1M; Wed, 31 Jan 2024 15:42:33 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rVCjP-04gmIP-26;
 Wed, 31 Jan 2024 15:42:32 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Wed, 31 Jan 2024 10:42:30 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Wed, 31 Jan 2024 10:42:30 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Message-ID: <ZbpqZqyIHuX0s5vz@panther>
References: <20240131111641.4418-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131111641.4418-1-W_Armin@gmx.de>
X-Smtpcorp-Track: 1rVCMe04gXme26.I3p_vfPhLy3B9
Feedback-ID: 498822m:498822aoToIo_:498822soj83CG8eh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 31 Jan 12:16, Armin Wolf wrote:
> This patch series adds support for the ACPI PNP0C32 device as
> proposed in 2022 by Arvid Norlander. The first patch adds support
> for the device itself, while the second patch was taken from the
> original series.
> 
> Both patches are compile-tested only.
> 
> Armin Wolf (1):
>   platform/x86: Add ACPI quickstart button (PNP0C32) driver
> 
> Arvid Norlander (1):
>   platform/x86: toshiba_acpi: Add quirk for buttons on Z830
> 
>  MAINTAINERS                         |   6 +
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/quickstart.c   | 225 ++++++++++++++++++++++++++++
>  drivers/platform/x86/toshiba_acpi.c |  36 ++++-
>  5 files changed, 280 insertions(+), 3 deletions(-)

No change here in HP Compaq land, except for the existence of this new
Quickstart Button1, no activity is reported via my HP WMI hotkeys or the
Quickstart Button, but rather through AT Translated Set 2 keyboard, as
usual - the same behaviour as not having hp-wmi or quickstart (eg. if I
unload the modules).

[    2.517431] input: HP WMI hotkeys as /devices/virtual/input/input14

[    4.397304] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032) is beyond end of object (length 0x32) (20230628/exoparg2-393)
[    4.399581] ACPI Error: Aborting method \_SB.C27D.WQBE due to previous error (AE_AML_BUFFER_LIMIT) (20230628/psparse-529)
[    4.425162] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032) is beyond end of object (length 0x32) (20230628/exoparg2-393)
[    4.426760] ACPI Error: Aborting method \_SB.C27D.WQBE due to previous error (AE_AML_BUFFER_LIMIT) (20230628/psparse-529)
[    4.593291] hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not supported"

[    4.606696] input: Quickstart Button 1 as /devices/platform/PNP0C32:00/input/input16

/dev/input/event4 (AT Translated Set 2 keyboard) opened successfully
/dev/input/event6 (HP WMI hotkeys) opened successfully
/dev/input/event8 (Quickstart Button 1) opened successfully


Maybe this HP documentation might help, there are ACPI tables and stuff
mentioned around page 8 ... http://dennisn.mooo.com/stuff/direct-launch.pdf
