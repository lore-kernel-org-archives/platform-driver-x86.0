From: Yidi Lin <yidi.lin@canonical.com>
Subject: Re: [PATCH] dell-laptop: Enable rfkill on Inspiron 3437
Date: Thu, 8 May 2014 15:19:37 +0800
Message-ID: <CAFquV7XHmrP6eqQC-P_g43bY15iHF8dmfwkaSC58FhOHfO=iwA@mail.gmail.com>
References: <1399446603-8467-1-git-send-email-yidi.lin@canonical.com>
	<20140507115317.GA818@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yh0-f42.google.com ([209.85.213.42]:64940 "EHLO
	mail-yh0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038AbaEHHTh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 May 2014 03:19:37 -0400
Received: by mail-yh0-f42.google.com with SMTP id t59so1978451yho.29
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 May 2014 00:19:37 -0700 (PDT)
In-Reply-To: <20140507115317.GA818@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, yk@canonical.com

Hi Mattew,

I only have Inspiron 7737 and Inspiron 3437 on hand to verify my patch.
rfkill does not function on Inspiron 7737 with force_rfkill=1 boot parameter.
But it works on Inspiron 3437.
So I only whitelist Inspiron 3437 for rfkill functionality.

Can you give me some advice for validation ?
Thanks.

Edward

On Wed, May 7, 2014 at 7:53 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> The information we had from Dell is that the rfkill functionality isn't
> validated on Inspiron devices. How do we know this works under all
> circumstances?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
