From: Mattia Dongili <malattia@linux.it>
Subject: Re: 2.6.39-rc3: sony-laptop regression
Date: Tue, 12 Apr 2011 23:07:06 +0900
Message-ID: <20110412140705.GA32119@kamineko.org>
References: <BANLkTimXEDriJ7wNX25Ko0iu=dnuCXNQww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:49665 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755258Ab1DLOHL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2011 10:07:11 -0400
Received: by iwn34 with SMTP id 34so6671943iwn.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2011 07:07:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <BANLkTimXEDriJ7wNX25Ko0iu=dnuCXNQww@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Apr 12, 2011 at 08:47:36AM +0200, Manuel Lauss wrote:
> Hello Mattia,

Hi!

> sony-laptop bugs out with a null ptr dereference on my VGN-A197 (see below).
> A temporary fix is to check if handles is NULL in sony_find_snc_handle:

Thanks!
The same fix is already in the platform-driver tree but apparently
didn't make it to Linus's tree yet. It should get there soon.

Cheers
-- 
mattia
:wq!
