From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] x86: Don't enable EEEPC_LAPTOP in default configs
Date: Thu, 19 May 2011 14:08:37 +0200
Message-ID: <BANLkTin08RzpKdaam6qnhcUZjJCV2tTO9Q@mail.gmail.com>
References: <20110519134701.1d3a8d55@endymion.delvare>
	<20110519115400.GA10725@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:42932 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756530Ab1ESMIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2011 08:08:39 -0400
Received: by ewy4 with SMTP id 4so735883ewy.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2011 05:08:38 -0700 (PDT)
In-Reply-To: <20110519115400.GA10725@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Jean Delvare <khali@linux-fr.org>, x86@kernel.org, platform-driver-x86@vger.kernel.org

On Thu, May 19, 2011 at 1:54 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Thu, May 19, 2011 at 01:47:01PM +0200, Jean Delvare wrote:
>> Can someone explain why CONFIG_EEEPC_LAPTOP=y in x86/configs/*_defconfig
>> when all other laptop support is off by default?
>
> Linus owns an Eee?

Then it's probably not a 901 or a 701, and CONFIG_EEEPC_WMI=y should
be used instead :).

-- 
Corentin Chary
http://xf.iksaif.net
