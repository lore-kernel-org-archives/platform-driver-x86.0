From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH v2 2/3] asus-laptop: use DEVICE_ATTR_* macros
Date: Wed, 21 Jan 2015 15:19:17 -0500 (EST)
Message-ID: <1741852285.168343.1421871557328.JavaMail.root@mail>
References: <20150121182803.GC7386@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([209.172.62.77]:61107 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751815AbbAUUTS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Jan 2015 15:19:18 -0500
In-Reply-To: <20150121182803.GC7386@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com

Hi Darren,

> > Use DEVICE_ATTR_{RO,WO,RW} macros to simplify attributes
> > declarations.
>
> It does a lot more than that, including a lot of seemingly
> superfluous reformatting of function declarations and renaming.

What do you mean? DEVICE_ATTR_RW(foo) requires foo_show() and foo_store()
functions, not show_foo() and store_foo().

Thanks,
-v
