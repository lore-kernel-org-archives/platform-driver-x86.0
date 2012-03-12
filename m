From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Add support for transflective LCD
Date: Mon, 12 Mar 2012 15:27:15 +0100
Message-ID: <CAHR064gY0JK775WSDBZ2BjrqGjkwHRzJmJ2ndgbXcTQROjqKJg@mail.gmail.com>
References: <4F3ECEED.9000206@gmail.com>
	<20120312141118.GB11375@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:55655 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684Ab2CLO1Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 10:27:16 -0400
In-Reply-To: <20120312141118.GB11375@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Akio Idehara <zbe64533@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Charles@schwieters.org

On Mon, Mar 12, 2012 at 3:11 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> Is there any userspace that currently manipulates the bl_power field?
> I'm wondering whether this should actually just be implemented by adding
> an extra level to the backlight and having 0 change to transflective
> mode.

I've seen some scripts doing it. But adding an extra level seems a
good idea, as long as power still works as espected.

-- 
Corentin Chary
http://xf.iksaif.net
