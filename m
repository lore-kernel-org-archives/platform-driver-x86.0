From: Alberto Mardegan <mardy@users.sourceforge.net>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Sat, 28 May 2011 10:15:28 +0300
Message-ID: <4DE0A110.4010102@users.sourceforge.net>
References: <4DDE9B92.3090504@users.sourceforge.net> <20110527163346.GD16769@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33591 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021Ab1E1HPg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 May 2011 03:15:36 -0400
Received: by eyx24 with SMTP id 24so893473eyx.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 May 2011 00:15:35 -0700 (PDT)
In-Reply-To: <20110527163346.GD16769@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>, Ike Panhc <ike.pan@canonical.com>

On 05/27/2011 07:33 PM, Matthew Garrett wrote:
> If we're not interested in providing continual fine-grained data then 
> the easiest approach may be to present as an input device and then just 
> send updated values whenever you receive the coarse udpate signal. But 
> you probably want to bring this up on LKML so we can make sure 
> everyone's exposing this in the same way.

OK, I will.

>> I know that no one is happy of directly accessing the raw I/O ports, but
>> all my attempts of reading these values through the ACPI interfaces or
>> the EC fields have failed: the fields are always set to 0.
> 
> Does the accelerometer appear as an ACPI device?

No, I think it doesn't. There are some fields in the EC device which
might be related to it, but I tried to read them without luck.
Here's the DSDT, anyway:
http://www.mardy.it/archivos/DSDT.dsl

Ciao,
  Alberto

-- 
http://blog.mardy.it <- geek in un lingua international!
