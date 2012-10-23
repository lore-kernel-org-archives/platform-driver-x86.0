From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH v5] thinkpad-acpi: Improve hardware volume controls
Date: Tue, 23 Oct 2012 14:45:46 -0700
Message-ID: <CAObL_7H1pEguOT7Jo6HrD1RsPEin_Joyaoydm8NS0cR3KAojkQ@mail.gmail.com>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <20110614015808.GB27997@khazad-dum.debian.net> <BANLkTimwQavNth_+hemY8F6D0_feUTEqGg@mail.gmail.com>
 <20110723194024.GA29866@khazad-dum.debian.net> <20110803033040.GA17685@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:33464 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754200Ab2JWVqH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Oct 2012 17:46:07 -0400
Received: by mail-ie0-f174.google.com with SMTP id k13so6060557iea.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Oct 2012 14:46:07 -0700 (PDT)
In-Reply-To: <20110803033040.GA17685@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Tue, Aug 2, 2011 at 8:30 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> The patch breaks the driver on IBM thinkpads.  I have updated it for the
> pr_foo macros, and I will fix it to do the right thing on older thinkpads so
> that it won't cause the driver to abort probing :-)
>
> Then, I will test it further.

What's the status of this?

--Andy
