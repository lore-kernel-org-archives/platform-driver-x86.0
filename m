From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] Fixes for dell-laptop.c driver
Date: Mon, 22 Jun 2015 11:02:18 -0700
Message-ID: <20150622180218.GB58421@vmdeb7>
References: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59247 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753573AbbFVSCM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Jun 2015 14:02:12 -0400
Content-Disposition: inline
In-Reply-To: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 21, 2015 at 10:39:25AM +0200, Pali Roh=E1r wrote:
> This patch series contains contains two fixes (properly check return
> values of all SMBIOS calls and fix calling correct page alloc/free
> functions) and documentation update together with extending debugfs
> code. Patch which fixes calling page alloc/free functions should be
> backported to stable kernel series as it it fix kernel crash.

See stable_kernel_rules and add the stable Cc to this one patch please.

--=20
Darren Hart
Intel Open Source Technology Center
