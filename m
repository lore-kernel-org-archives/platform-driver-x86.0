From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 5/7] x86 platform drivers: hp-wmi Set placeholder for unimplemented events
Date: Fri, 28 May 2010 17:10:08 +0200
Message-ID: <201005281710.08893.trenn@suse.de>
References: <1274451495-10252-1-git-send-email-trenn@suse.de> <1274451495-10252-6-git-send-email-trenn@suse.de> <20100528133314.GB25189@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20100528133314.GB25189@srcf.ucam.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Friday 28 May 2010 15:33:14 Matthew Garrett wrote:
> On Fri, May 21, 2010 at 04:18:13PM +0200, Thomas Renninger wrote:
> > And tell the user that those have happened.
> 
> Marking these as unimplemented seems fine, but I think the message is 
> too much - my system generates the smart charger events, and I'd
> rather not have even more spew when I plug/unplug. Mind if I merge
> this without the messages?
Fine with me, thanks.

     Thomas
