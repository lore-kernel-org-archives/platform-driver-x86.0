From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/3] Add support for X1 Yoga (2016) Tablet Mode +
 refactors
Date: Tue, 01 Nov 2016 13:25:45 -0400
Message-ID: <1478021145.4206.0.camel@redhat.com>
References: <1477954535-12536-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60218 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750832AbcKARZs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2016 13:25:48 -0400
In-Reply-To: <1477954535-12536-1-git-send-email-lyude@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net
Cc: Daniel Martin <consume.noise@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Got in touch with a friend who happened to have a X201 and had them
test the patches, so I've confirmed this doesn't break anything with
older ThinkPad tablets.

On Mon, 2016-10-31 at 18:55 -0400, Lyude wrote:
> Updated patchset for adding support for detecting tablet mode on the
> X1 Yoga
> 2016 model, along with some refactoring suggested by Daniel.
> 
> Important: I realized I never actually tried testing this on any of
> the older
> Thinkpad tablets. If someone has one who is willing to test let me
> know,
> otherwise I'll test it out when I get to the office on Thursday.
> 
> Signed-off-by: Lyude <lyude@redhat.com>
> Cc: Daniel Martin <consume.noise@gmail.com>
> 
> Lyude (3):
>   thinkpad_acpi: Move tablet detection into separate function
>   thinkpad_acpi: Don't repeat ourselves in hotkey_init_tablet_mode()
>   thinkpad_acpi: Add support for X1 Yoga (2016) Tablet Mode
> 
>  drivers/platform/x86/thinkpad_acpi.c | 88
> ++++++++++++++++++++++++++++++------
>  1 file changed, 73 insertions(+), 15 deletions(-)
> 
-- 
Cheers,
	Lyude
