From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v5 2/5] dell-wmi, dell-laptop: select DMI
Date: Wed, 17 Feb 2016 12:32:22 -0800
Message-ID: <CALCETrVZA0ZAmSyZKWjQyzYpx3F3d+taCPye99=XxWKw-UBvOg@mail.gmail.com>
References: <cover.1455553470.git.luto@kernel.org> <f134070fe93b5ce81ceea9071497d853b7e7db9c.1455553470.git.luto@kernel.org>
 <20160217063937.GB20116@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33963 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965253AbcBQUcm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 15:32:42 -0500
Received: by mail-ob0-f169.google.com with SMTP id wb13so33628240obb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Feb 2016 12:32:42 -0800 (PST)
In-Reply-To: <20160217063937.GB20116@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jon Eyolfson <jon@eyl.io>, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Feb 16, 2016 10:39 PM, "Darren Hart" <dvhart@infradead.org> wrote:
>
> On Mon, Feb 15, 2016 at 08:32:34AM -0800, Andy Lutomirski wrote:
> > dell-wmi and dell-laptop will compile but won't work right if DMI
> > isn't selected.
>
> Was this necessitated by patch 1/5, or was this an existing problem? If the
> former, I'd prefer to just include this in 1/5. If the latter, this is fine.

It's an existing problem, I believe.  Jean noticed when reviewing an
earlier version of patch 1 IIRC.

--Andy
