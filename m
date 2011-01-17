From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Additional TOS1900 devices support
Date: Mon, 17 Jan 2011 11:08:49 -0800
Message-ID: <20110117190849.GB27245@core.coreip.homeip.net>
References: <AANLkTi=fjL0yxXWrDddafdBs7biJ326sXjaagTseVEVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:57720 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752055Ab1AQTJB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Jan 2011 14:09:01 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=fjL0yxXWrDddafdBs7biJ326sXjaagTseVEVg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

Hi Azael,

On Mon, Jan 17, 2011 at 10:45:01AM -0700, Azael Avalos wrote:
> 
> -static const struct key_entry toshiba_acpi_keymap[] __initconst = {
> +static struct key_entry toshiba_acpi_keymap[]  = {

Why are we losing constness here?

Thanks.

-- 
Dmitry
