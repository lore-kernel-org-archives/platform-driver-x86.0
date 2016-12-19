From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [platform-drivers-x86:testing 4/7]
 drivers/platform/x86/surface3-wmi.c:81:2-8: preceding lock on line 68
Date: Mon, 19 Dec 2016 14:22:51 +0200
Message-ID: <1482150171.9552.94.camel@linux.intel.com>
References: <alpine.DEB.2.10.1612191134010.2994@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:41078 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751192AbcLSMWz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Dec 2016 07:22:55 -0500
In-Reply-To: <alpine.DEB.2.10.1612191134010.2994@hadrien>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kbuild-all@01.org

On Mon, 2016-12-19 at 11:35 +0100, Julia Lawall wrote:
> It looks like an unlock may be missing before the returnon line 81.
> 
> julia

There is a patch already in the tree to fix that.
Thanks!

> 
> 
> tree:   git://git.infradead.org/users/dvhart/linux-platform-drivers-
> x86.git testing
> head:   9b0d7c8018708b798c0bd6d4fe9512754c1e8c18
> commit: d183a21a0df57d187dbccd710ebb5a5e457251f4 [4/7] platform/x86:
> Add custom surface3 platform device for controlling LID
> :::::: branch date: 84 minutes ago
> :::::: commit date: 2 hours ago
> 
> >> drivers/platform/x86/surface3-wmi.c:81:2-8: preceding lock on line
> 68
> 
> git remote add platform-drivers-x86
> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git
> git remote update platform-drivers-x86
> git checkout d183a21a0df57d187dbccd710ebb5a5e457251f4
> vim +81 drivers/platform/x86/surface3-wmi.c
> 
> d183a21a Benjamin Tissoires 2016-11-25  62  {
> d183a21a Benjamin Tissoires 2016-11-25  63      acpi_status status;
> d183a21a Benjamin Tissoires 2016-11-25  64      union acpi_object
> *obj;
> d183a21a Benjamin Tissoires 2016-11-25  65
> d183a21a Benjamin Tissoires 2016-11-25  66      struct acpi_buffer
> output = { ACPI_ALLOCATE_BUFFER, NULL };
> d183a21a Benjamin Tissoires 2016-11-25  67
> d183a21a Benjamin Tissoires 2016-11-25
> @68      mutex_lock(&s3_wmi_lock);
> d183a21a Benjamin Tissoires 2016-11-25  69      status =
> wmi_query_block(guid, instance, &output);
> d183a21a Benjamin Tissoires 2016-11-25  70
> d183a21a Benjamin Tissoires 2016-11-25  71      obj = output.pointer;
> d183a21a Benjamin Tissoires 2016-11-25  72
> d183a21a Benjamin Tissoires 2016-11-25  73      if (!obj || obj->type
> != ACPI_TYPE_INTEGER) {
> d183a21a Benjamin Tissoires 2016-11-25  74              if (obj) {
> d183a21a Benjamin Tissoires 2016-11-25 
> 75                      pr_err("query block returned object type: %d -
> buffer length:%d\n",
> d183a21a Benjamin Tissoires 2016-11-25  76                            
> obj->type,
> d183a21a Benjamin Tissoires 2016-11-25  77                            
> obj->type == ACPI_TYPE_BUFFER ?
> d183a21a Benjamin Tissoires 2016-11-25 
> 78                                              obj->buffer.length :
> 0);
> d183a21a Benjamin Tissoires 2016-11-25  79              }
> d183a21a Benjamin Tissoires 2016-11-25  80              kfree(obj);
> d183a21a Benjamin Tissoires 2016-11-25 @81              return
> -EINVAL;
> d183a21a Benjamin Tissoires 2016-11-25  82      }
> d183a21a Benjamin Tissoires 2016-11-25  83      *ret = obj-
> >integer.value;
> d183a21a Benjamin Tissoires 2016-11-25  84      kfree(obj);
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
