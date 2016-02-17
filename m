From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v5 0/5] dell fixes and Skylake updates
Date: Wed, 17 Feb 2016 12:33:01 -0800
Message-ID: <CALCETrXue_6LRWdQuxJ0J0svtMJ06DH92-VFU6AKS_O6TyvzEQ@mail.gmail.com>
References: <cover.1455553470.git.luto@kernel.org> <20160217070056.GD20116@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35532 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965253AbcBQUdV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 15:33:21 -0500
Received: by mail-ob0-f171.google.com with SMTP id xk3so33446216obc.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Feb 2016 12:33:21 -0800 (PST)
In-Reply-To: <20160217070056.GD20116@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Tue, Feb 16, 2016 at 11:00 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Feb 15, 2016 at 08:32:32AM -0800, Andy Lutomirski wrote:
>> This is the successor to v3 of the dmi walk fixes and v4 of the Skylake
>> stuff.  The Skylake history is in that patch's notes.
>
> Only mostly minor comments from me and one from Pali. I've pushed this to a
> dell-skylake topic branch to let 0-day beat on it for a day. Please have a look
> at my review and Pali's and send any necessary updates.
>

It looks like all necessary updates are comment changes.  Should I
just send follow-up patches to address them?

--Andy
