From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Add support for Acer Predator macro keys
Date: Thu, 5 May 2016 15:40:44 -0700
Message-ID: <20160505224044.GE2113@f23x64.localdomain>
References: <1457244539-23763-1-git-send-email-bero@lindev.ch>
 <1457245049-4326-1-git-send-email-bero@lindev.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44524 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757677AbcEEWkz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 May 2016 18:40:55 -0400
Content-Disposition: inline
In-Reply-To: <1457245049-4326-1-git-send-email-bero@lindev.ch>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@lindev.ch>
Cc: platform-driver-x86@vger.kernel.org, jlee@suse.com, carlos@strangeworlds.co.uk

On Sun, Mar 06, 2016 at 07:17:29AM +0100, Bernhard Rosenkr=E4nzer wrote=
:
> This patch adds support for the macro keys found on
> Acer Predator laptops.

Hi Bernhard,

Thank you for your patch.

In your future submissions, please include all the maintainers listed i=
n
MAINTAINERS in your Cc list. My scripts catch these and I get to them
eventually, but it's after all those that hit my inbox directly.

The patch seems generally good, however it has a number of style issues=
 which
checkpatch catches. Please run checkpatch on this patch, correct the st=
yle
issues, and resubmit.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
