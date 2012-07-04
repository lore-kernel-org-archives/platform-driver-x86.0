From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Wed, 04 Jul 2012 18:09:04 +0800
Message-ID: <4FF41640.8060608@canonical.com>
References: <1338811006.17357.3.camel@lenovo-ideapad-z570.gentooroot.dyndns.org> <20120626183110.GA29375@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:55686 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063Ab2GDKJN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Jul 2012 06:09:13 -0400
In-Reply-To: <20120626183110.GA29375@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, platform-driver-x86@vger.kernel.org

On 06/27/2012 02:31 AM, Matthew Garrett wrote:
> Ike, feelings on this? Do we know that these EC offsets are stable?
> 

Hi Maxim,

I separate your patch into three smaller patch. It makes me easier to understand the detail. Please review if all function are still working fine on your ideapad
