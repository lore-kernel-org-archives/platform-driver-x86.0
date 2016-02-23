From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Tue, 23 Feb 2016 11:42:14 -0600
Message-ID: <56CC99F6.9060009@dell.com>
References: <cover.1455553470.git.luto@kernel.org>
 <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
 <20160217111634.GQ1476@pali> <56C47090.1050106@dell.com>
 <20160223120100.GN4606@pali>
 <CALCETrU98nEhLQSr7M+DsvD2Fgk5K0GFPFBoLE8_k-_ZRg72mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:20906 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754640AbcBWRmP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Feb 2016 12:42:15 -0500
In-Reply-To: <CALCETrU98nEhLQSr7M+DsvD2Fgk5K0GFPFBoLE8_k-_ZRg72mA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Jon Eyolfson <jon@eyl.io>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>



On 02/23/2016 11:35 AM, Andy Lutomirski wrote:
>
> Presumably this works on Windows 7 because either there is no
> equivalent of intel-hid or because the DSDT turns it off -- I haven't
> checked which is the case.
That's correct, the DSDT doesn't offer the ACPI device corresponding to
intel-hid for Linux in Win7 otherwise it would be a "yellow bang" in
device manager that can't be resolved.
