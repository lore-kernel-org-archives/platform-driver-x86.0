From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Wed, 14 Jun 2017 17:46:54 +0200
Message-ID: <20170614154654.GA22981@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <201706102115.57995@pali>
 <20170613164951.GI27850@fury>
 <201706132004.58051@pali>
 <20170613184228.GC22450@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:36810 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752026AbdFNPrB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jun 2017 11:47:01 -0400
Content-Disposition: inline
In-Reply-To: <20170613184228.GC22450@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 13 June 2017 11:42:28 Darren Hart wrote:
> On Tue, Jun 13, 2017 at 08:04:57PM +0200, Pali Rohár wrote:
> > On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
> > > I'd suggest reaching out to the maintainers and contributors to the
> > > drivers you mention to request some help in testing.
> > 
> > Seems sane. Grep for all methods with instance number different as zero 
> > (or just number one -- which can be suspicious as somebody could thought 
> > that indexing is from one, not zer) and try to receive ACPI/BMOF data 
> > and verify it.
> 
> This would still be the ideal solution, verify we can do the right thing
> without breaking existing drivers. Agreed.

Here is all usage:

Function wmi_set_block:

  msi-wmi.c:
  instance=0 /* Instance 0 is "set backlight" */

  tc1100-wmi.c:
  instance=TC1100_INSTANCE_WIRELESS /* defined as 1 */
  instance=TC1100_INSTANCE_JOGDIAL  /* defined as 2 */

Function wmi_query_block:

  acer-wmi.c:
  instance=1 /* no comment why, guid=95764E09-FB56-4E83-B31A-37761F60994A */

  dell-wmi.c:
  instance=0

  msi-wmi.c:
  instance=1 /* Instance 1 is "get backlight", cmp with DSDT */

  surface3-wmi.c:
  instance=0

  tc1100-wmi.c:
  (same as in wmi_set_block)

Function wmi_evaluate_method:

  acer-wmi.c:
  instance=1 /* no comment why, guid=67C3371D-95A3-4C37-BB61-DD47B491DAAB */
  instance=1 /* no comment why, guid=6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 */
  instance=0

  alienware-wmi.c:
  instance=1 /* no comment why, guid=A70591CE-A997-11DA-B012-B622A1EF5492 */
  instance=1 /* no comment why, guid=A80593CE-A997-11DA-B012-B622A1EF5492 */
  instance=1 /* no comment why, guid=A70591CE-A997-11DA-B012-B622A1EF5492 */

  asus-wmi.c:
  instance=1 /* no comment why, guid=97845ED0-4E6D-11DE-8A39-0800200C9A66 */

  dell-wmi-led.c:
  instance=1 /* no comment why, guid=F6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396 */

  hp-wmi.c:
  instance=0

  mxm-wmi.c:
  instance=1 /* no comment why, guid=F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0 */

So problematic drivers which use instance=1 without any comments are:

  acer-wmi
  alienware-wmi
  asus-wmi
  dell-wmi-led
  mxm-wmi

-- 
Pali Rohár
pali.rohar@gmail.com
