From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH 16/23] msi-wmi: Use pr_fmt and pr_<level>
Date: Wed, 30 Mar 2011 16:16:46 +0200
Message-ID: <20110330161646.59743cb2@destiny.ordissimo>
References: <cover.1301436234.git.joe@perches.com>
	<03d9dcf405e4a12d137f1fea83bc920f0b8de923.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:52790 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755959Ab1C3OUV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Mar 2011 10:20:21 -0400
In-Reply-To: <03d9dcf405e4a12d137f1fea83bc920f0b8de923.1301436234.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Joe,

On Tue, 29 Mar 2011 15:21:47 -0700, Joe Perches <joe@perches.com> wrote :

> Added pr_fmt.
> Removed now unused #define DRV_PFX
> Convert dprintk to pr_debug.
> Convert printks to pr_<level>.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Anisse Astier <anisse@astier.eu>

I've been wanting to do that since I replaced original dprintk
implementation with pr_debug. I just didn't know you could use the
pr_fmt() macro to manipulate prefixes.

Regards,

Anisse

> ---
>  drivers/platform/x86/msi-wmi.c |   45 +++++++++++++++++----------------------
>  1 files changed, 20 insertions(+), 25 deletions(-)
> 
