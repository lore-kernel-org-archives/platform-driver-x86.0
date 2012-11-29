From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ACPI ALS driver for iio introduced.
Date: Thu, 29 Nov 2012 11:18:18 +0100
Message-ID: <50B7366A.9040800@metafoo.de>
References: <CAHR064j_7Y3wYXVXmC4TqZHxkqa0Z2HK84-OaDTiC7oesB_TrQ@mail.gmail.com> <1354157205-2956-1-git-send-email-marxin.liska@gmail.com> <1354157205-2956-2-git-send-email-marxin.liska@gmail.com> <CAHR064gj3CUUZyuGiw6WhLjGQrhq-eAOKr-=+UmpW2Ry3mce8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHR064gj3CUUZyuGiw6WhLjGQrhq-eAOKr-=+UmpW2Ry3mce8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?TWFydGluIExpxaFrYQ==?= <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Zhang, Rui" <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, joeyli <jlee-IBi9RG/b67k@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, Jon Brenner <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On 11/29/2012 09:02 AM, Corentin Chary wrote:
> On Thu, Nov 29, 2012 at 2:46 AM,  <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: marxin <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> ---
>>  drivers/iio/industrialio-buffer.c    |    4 +-
>>  drivers/staging/iio/light/Kconfig    |    6 +
>>  drivers/staging/iio/light/Makefile   |    1 +
>>  drivers/staging/iio/light/acpi-als.c |  486 ++++++++++++++++++++++++++++++++++
>>  4 files changed, 495 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/staging/iio/light/acpi-als.c
>>
>> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
>> index aaadd32..b8b377c 100644
>> --- a/drivers/iio/industrialio-buffer.c
>> +++ b/drivers/iio/industrialio-buffer.c
>> @@ -119,8 +119,8 @@ static ssize_t iio_scan_el_show(struct device *dev,
>>         int ret;
>>         struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>>
>> -       ret = test_bit(to_iio_dev_attr(attr)->address,
>> -                      indio_dev->buffer->scan_mask);
>> +       ret = !!(test_bit(to_iio_dev_attr(attr)->address,
>> +                      indio_dev->buffer->scan_mask));
> 
> It's strange that you have to do that.
> Can you give use the exact values that make test_bit return something
> else that 1 or 0 ?
> Maybe there is a bug to fix in test_bit here.

Even if this was a bug in IIO this should be in a separate patch.

> 
>>
>>         return sprintf(buf, "%d\n", ret);
>>  }
[...]
