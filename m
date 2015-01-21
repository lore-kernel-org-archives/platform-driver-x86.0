From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/3] asus-laptop: use DEVICE_ATTR_* macros
Date: Wed, 21 Jan 2015 10:28:03 -0800
Message-ID: <20150121182803.GC7386@vmdeb7>
References: <1421623526-20555-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1421623526-20555-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47784 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752275AbbAUS2D (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Jan 2015 13:28:03 -0500
Content-Disposition: inline
In-Reply-To: <1421623526-20555-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com

On Sun, Jan 18, 2015 at 06:25:25PM -0500, Vivien Didelot wrote:
> Use DEVICE_ATTR_{RO,WO,RW} macros to simplify attributes declarations.

It does a lot more than that, including a lot of seemingly superfluous
reformatting of function declarations and renaming.

-- 
Darren Hart
Intel Open Source Technology Center
