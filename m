From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] thinkpad_acpi: moved hotkey_thread_mutex lock after
 set_freezable()
Date: Mon, 25 Feb 2013 15:54:45 -0800
Message-ID: <20130225155445.d3eef1ad.akpm@linux-foundation.org>
References: <1361697722-4575-1-git-send-email-artem.savkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56568 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752513Ab3BYXyr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Feb 2013 18:54:47 -0500
In-Reply-To: <1361697722-4575-1-git-send-email-artem.savkov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Artem Savkov <artem.savkov@gmail.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, linux-kernel@vger.kernel.org

On Sun, 24 Feb 2013 13:22:02 +0400
Artem Savkov <artem.savkov@gmail.com> wrote:

> set_freezable() checks freezing during which no locks should be held.
> hotkey_thread_mutex lock should be moved closer to where it is actually needed.
> 

Thanks.

When fixing a bug, we always like to see a full description of that bug
so we can better work out which kernel versions need the fix.

Did you actually hit a lockup because of this?  Or was it just from
code inspection?  Or ...  ?
