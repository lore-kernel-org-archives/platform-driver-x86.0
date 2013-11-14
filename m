From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/3] ipc: Added platform data structure
Date: Thu, 14 Nov 2013 13:42:18 +0000
Message-ID: <20131114134218.638373ef@alan.etchedpixels.co.uk>
References: <1384373671-12814-1-git-send-email-david.a.cohen@linux.intel.com>
	<1384373671-12814-2-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1384373671-12814-2-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, eric.ernst@linux.intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 13 Nov 2013 12:14:29 -0800
David Cohen <david.a.cohen@linux.intel.com> wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Since the same ipc driver can be used by many platforms, using
> macros for defining ipc_base and i2c_base addresses is not
> a scalable approach. So added a platform data structure to pass
> this information.
> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: David Cohen <david.a.cohen@linux.intel.com>

Acked-by: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
