From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 12/15] samsung-laptop: add true rfkill support for swsmi
Date: Wed, 23 Nov 2011 07:37:17 +0100
Message-ID: <CAHR064hUBJWpJL-jeqAEANnd-fZgBQCHrczwAbV0Tsy-0tUTXA@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-13-git-send-email-corentincj@iksaif.net>
	<20111122222457.GL24283@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-dy0-f46.google.com ([209.85.220.46]:57336 "EHLO
	mail-dy0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753278Ab1KWGhV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 01:37:21 -0500
In-Reply-To: <20111122222457.GL24283@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Tue, Nov 22, 2011 at 11:24 PM, Greg KH <gregkh@suse.de> wrote:
> On Tue, Nov 22, 2011 at 11:02:43PM +0100, Corentin Chary wrote:
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>
> What happens on machines that don't support this?

As I understand things, SwSMI == SABI3, and it looks a very clear and
stable interface. My guess is that all SABI3 machines support this
command. If it is not the case, swsmi_wireless_status() will fail, and
rfkill won't be created.

-- 
Corentin Chary
http://xf.iksaif.net
