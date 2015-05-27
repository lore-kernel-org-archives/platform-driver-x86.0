From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH v4] platform:x86: add Intel Broxton PMC IPC driver
Date: Wed, 27 May 2015 10:36:58 +0200
Message-ID: <87oal6mn6d.fsf@nemi.mork.no>
References: <1432216020-21643-1-git-send-email-qipeng.zha@intel.com>
	<20150527060240.GA2681@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:34512 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752571AbbE0Ihp convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 04:37:45 -0400
In-Reply-To: <20150527060240.GA2681@fury.dvhart.com> (Darren Hart's message of
	"Tue, 26 May 2015 23:02:40 -0700")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "qipeng.zha" <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Jacob Pan <jacob.jun.pan@intel.com>

Darren Hart <dvhart@infradead.org> writes:

>> +static DEVICE_ATTR(simplecmd, S_IWUSR | S_IRUSR,
>> +		NULL,
>> +		intel_pmc_ipc_simple_cmd_store);
>> +static DEVICE_ATTR(northpeak, S_IWUSR | S_IRUSR,
>> +		NULL,
>> +		intel_pmc_ipc_northpeak_store);
>> +
>> +static struct attribute *intel_ipc_attrs[] =3D {
>> +	&dev_attr_northpeak.attr,
>> +	&dev_attr_simplecmd.attr,
>> +	NULL
>> +};
>
>
> Please use the DEVICE_ATTR_RW macro.

Minor nit-nit: Those attributes don't have any "show" function so you
cannot use DEVICE_ATTR_RW. If they really are not intended to be
readable, then the DEVICE_ATTR_WO macro could be used for that.


Bj=C3=B8rn
