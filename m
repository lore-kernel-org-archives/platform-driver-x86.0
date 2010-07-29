From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: Patch for toshiba_acpi driver : add illumination support
Date: Thu, 29 Jul 2010 07:12:10 +0200
Message-ID: <AANLkTikM5EM6w51uAQuaN1zErhTycdfJnpKHObrf5GHG@mail.gmail.com>
References: <201007282322.17656.pinaraf@pinaraf.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58416 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829Ab0G2FMM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Jul 2010 01:12:12 -0400
Received: by bwz1 with SMTP id 1so78473bwz.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2010 22:12:10 -0700 (PDT)
In-Reply-To: <201007282322.17656.pinaraf@pinaraf.info>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pierre <pinaraf@pinaraf.info>
Cc: platform-driver-x86@vger.kernel.org

> Of course, if this is not the right procedure or the right place, please correct
> me.

Hi Pierre,
Please read Documentation/SubmittingPatches.
The quick version is to use git and do:
$ git config user.name <name>
$ git config user.mail <mail>
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git
$ <hack>
$ git commit -sa
$ git format-patch origin -o /tmp/patchs/
$ ./scripts/get_maintainer.pl /tmp/patchs/*
$ ./scripts/checkpatch.pl /tmp/patchs/*
$ git send-email --to=<main mailing list> -cc=<maintainter0> -cc=<maintainer1>

Thanks
-- 
Corentin Chary
http://xf.iksaif.net
