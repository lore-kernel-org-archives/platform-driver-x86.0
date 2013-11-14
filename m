From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 2/3] ipc: Enabled ipc support for additional intel
 platforms
Date: Thu, 14 Nov 2013 13:43:11 +0000
Message-ID: <20131114134311.01d24bc5@alan.etchedpixels.co.uk>
References: <1384373671-12814-1-git-send-email-david.a.cohen@linux.intel.com>
	<1384373671-12814-3-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1384373671-12814-3-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, eric.ernst@linux.intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 13 Nov 2013 12:14:30 -0800
David Cohen <david.a.cohen@linux.intel.com> wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Enabled ipc support for penwell, clovertrail & tangier platforms.

At some point this really ought to be discoverable in your SFI, ACPI or
similar data tables not continually hard coded.

Alan
