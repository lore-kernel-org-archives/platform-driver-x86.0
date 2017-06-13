From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Tue, 13 Jun 2017 11:42:28 -0700
Message-ID: <20170613184228.GC22450@fury>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <201706102115.57995@pali>
 <20170613164951.GI27850@fury>
 <201706132004.58051@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:34371 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751826AbdFMSma (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 14:42:30 -0400
Content-Disposition: inline
In-Reply-To: <201706132004.58051@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 13, 2017 at 08:04:57PM +0200, Pali Rohár wrote:
> On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
> > On Sat, Jun 10, 2017 at 09:15:57PM +0200, Pali Rohár wrote:
> > > On Saturday 27 May 2017 13:55:34 Pali Rohár wrote:
> > > > instance_count defines number of instances of data block and
> > > > instance itself is indexed from zero, which means first instance
> > > > has number 0. Therefore check for invalid instance should be
> > > > non-strict inequality.
> > > > 
> > > > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> > > > ---
> > > > I'm marking this patch as RFC because it is not tested at all and
> > > > probably could break existing WMI drivers. Some WMI drivers pass
> > > > instance number 1 and I'm not sure if ACPI-WMI bytecode for those
> > > > machines has really two instances. In more cases ACPI-WMI
> > > > bytecode does not check instance number if supports only one
> > > > instance. So then any instance id can be used for correct
> > > > execution of ACPI-WMI method.
> > > > 
> > > > So this patch is open for discussion.
> > > 
> > > Hi! Any comments?
> > 
> > Hi Pali,
> > 
> > This change appears correct to me, but your comment about this
> > parameter being ignored by ACPI-WMI is definitely concerning. Since
> > this doesn't address a specific failure report, and it has the
> > potential to break functional drivers, I wouldn't want to merge it
> > without some evidence that those drivers still work.
> 
> I agree that it should not be merged without any other testing or 
> discussion. Reason why I marked it as RFC.
> 
> ACPI bytecode (which implements WMI functions) is often ignoring 
> instance method if there is only one instance. So it does not have to 
> decide which instance to call based on parameter.
> 
> IIRC it is also stated in that MSDN documentation.

That is my reading of it as well:

"One parameter is passed to the method--the index of the instance, which
is of type ULONG. Data blocks registered with only a single instance can
ignore the parameter."

  https://msdn.microsoft.com/en-us/library/windows/hardware/dn614028(v=vs.85).aspx

The "can" instead of "shall" makes our job harder. We could special case
the instance_count == 1 case and either skip the test (relying on the
WMI code to ignore or return an appropriate error - risky) or we could
force it to 0, which should always work per the specification, but it's
possible some firmware out there is just broken and misuses this
input... oh man... I bet that exists somewhere... "we can ignore
instance_count, so let's use it as a simple integer input for FOO....
ugh.

> 
> > I'd suggest reaching out to the maintainers and contributors to the
> > drivers you mention to request some help in testing.
> 
> Seems sane. Grep for all methods with instance number different as zero 
> (or just number one -- which can be suspicious as somebody could thought 
> that indexing is from one, not zer) and try to receive ACPI/BMOF data 
> and verify it.

This would still be the ideal solution, verify we can do the right thing
without breaking existing drivers. Agreed.

-- 
Darren Hart
VMware Open Source Technology Center
