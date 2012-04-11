From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: added BIOS mute interfaces for volume
Date: Wed, 11 Apr 2012 08:42:11 -0300
Message-ID: <20120411114211.GA11445@khazad-dum.debian.net>
References: <1334139302-7152-1-git-send-email-alex.hung@canonical.com>
 <4F855A2B.6070402@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F855A2B.6070402@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: ibm-acpi@hmh.eng.br, mjg@redhat.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 11 Apr 2012, Alex Hung wrote:
> I am modifying thinkpad_acpi so it can support the mute led, and I
> am looking for suggestions and feedbacks.
> 
> For newer BIOS, it includes three aml methods that can be used to
> get, set and enable the mute led.

Aha!  THANK YOU.

I will look at the patches this week.  Please send me (directly) a full
dmidecode and ACPI table dump.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
